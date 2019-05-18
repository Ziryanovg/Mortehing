#include "calculator.h"

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
    }

    delete command;

    emit calculationFinished();
}
