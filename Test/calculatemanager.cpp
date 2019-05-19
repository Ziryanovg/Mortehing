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
    emit calculationStarted();

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

    calculator->moveToThread(calcThread);

    connect(calcThread, SIGNAL(started()), calculator, SLOT(calculate()));
    connect(calculator, SIGNAL(functionCalculated(QPointF)), this, SLOT(functionCalculated(QPointF)));
    connect(calculator, SIGNAL(calculationFinished()), this, SLOT(calculationFinished()));

    calcThread->start();
}

void CalculateManager::calcPause()
{
    calculator->pause();
}

void CalculateManager::calcBreak()
{
    calculator->cancel();
}

void CalculateManager::calculationFinished()
{
    calcThread->quit();
    calcThread->deleteLater();

    if(calculator) delete calculator;

    emit calculationFinishedToQml();
}

void CalculateManager::functionCalculated(QPointF value)
{
    emit functionCalculatedSignal(value);
}

