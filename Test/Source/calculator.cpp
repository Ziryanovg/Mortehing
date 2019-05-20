#include "calculator.h"
#include <QThread>
#include "Commands/quadraticcommand.h"
#include "Commands/sincoscommand.h"
#include "Commands/logcommand.h"
#include "Commands/sincommand.h"

Calculator::Calculator(calcData& data,QObject *parent) : QObject(parent),m_data(data)
{

}

void Calculator::calculate()
{
    switch (m_data.functionIndex) {
        case 0: command = new QuadraticCommand();
            break;
        case 1: command = new SinCosCommand();
            break;
        case 2: command = new LogCommand();
            break;
        case 3: command = new SinCommand();
            break;
    }

    for (float x=m_data.From;x<=m_data.To;x+=m_data.Step) {

        float result = command->calculate(x,m_data.A,m_data.B,m_data.C);
        QPointF resultPoint(x,result);
        emit functionCalculated(resultPoint);

        QThread::usleep(1000);

        m_continue.lock();
        if (m_pauseRequired) {
            m_pauseManager.wait(&m_continue);
            // unlocks m_continue and blocks the thread until m_pauseManager.wakeAll()
        }
        m_continue.unlock();

        if(m_cancelRequested) break;
    }

    delete command;

    emit calculationFinished();
}

void Calculator::pause()
{
    if(!m_pauseRequired)
        m_pauseRequired = true;
    else {
        m_pauseRequired = false;
        m_pauseManager.wakeAll();
    }
}

void Calculator::cancel()
{
    pause();
    m_cancelRequested = true;
}
