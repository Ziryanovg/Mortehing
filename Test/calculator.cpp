#include "calculator.h"
#include <QThread>

Calculator::Calculator(calcData& data,QObject *parent) : QObject(parent),m_data(data)
{

}

void Calculator::calculate()
{
    switch (m_data.functionIndex) {
    case 0: command = new QuadraticCommand();
        break;
    }

    for (float x=m_data.From;x<=m_data.To;x+=m_data.Step) {
        float result = command->calculate(x,m_data.A,m_data.B,m_data.C);
        QPointF resultPoint(x,result);
        emit functionCalculated(resultPoint);
        QThread::usleep(2000);
        m_continue.lock();
        if (m_pauseRequired) {
            m_pauseManager.wait(&m_continue);
            // unlocks m_continue and blocks the thread until m_pauseManager.wakeAll()
        }
        m_continue.unlock();
    }

    delete command;

    emit calculationFinished();
}

void Calculator::pause()
{
    if(!m_pauseRequired)
        m_pauseRequired = true;
    else {
        this -> m_pauseRequired = false;
        this -> m_pauseManager.wakeAll();
    }
}
