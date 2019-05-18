#include "calculatemanager.h"
#include <QThread>
#include "calculationdata.h"

CalculateManager& CalculateManager::getInstance()
{
    static CalculateManager instance;
    return instance;
}

void CalculateManager::calcStart(int function_index, float A, float B, float C, float From, float To, float Step)
{
    calcThread = new QThread;

    calcData data;
    data.functionIndex = function_index;
    data.A = A;
    data.B = B;
    data.C = C;
    data.From = From;
    data.To = To;
    data.Step = Step;

    calculator = new Calculator(data);

    connect(calcThread, SIGNAL(started()), calculator, SLOT(calculate()));
    connect(calculator, SIGNAL(functionCalculated(QPointF)), this, SLOT(functionCalculated(QPointF)));
    connect(calculator, SIGNAL(calculationFinished()), this, SLOT(calculationFinished()));

    calcThread->start();
}

void CalculateManager::calcPause()
{
    if(m_AllowedCalc)
        m_AllowedCalc = false;
    else
        m_AllowedCalc = true;
}

void CalculateManager::calcBreak()
{
    calcThread->quit();
    calcThread->wait();
}

void CalculateManager::calculationFinished()
{
    if(calcThread)
    {
        calcThread->quit();
        calcThread->wait();
    }

    if(calculator) delete calculator;

    qDebug() << "finished";
}

void CalculateManager::functionCalculated(QPointF value)
{
    qDebug() << QString::number(value.x()) +" "+QString::number(value.y());
}

void CalculateManager::setAllowedCalc(bool AllowedCalc)
{
    if (m_AllowedCalc == AllowedCalc)
        return;

    m_AllowedCalc = AllowedCalc;
    emit AllowedCalcChanged(m_AllowedCalc);
}


