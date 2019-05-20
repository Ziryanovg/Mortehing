#include "calculatemanager.h"
#include <QThread>
#include "Model/calculationresultmodel.h"

CalculateManager& CalculateManager::getInstance()
{
    static CalculateManager instance;
    return instance;
}

void CalculateManager::calcStart(qint32 function_index,qreal A,qreal B,qreal C,qreal From,qreal To, qreal Step, bool FromLoad)
{
    m_calcThread = new QThread;

    m_data.functionIndex = function_index;
    m_data.A = A;
    m_data.B = B;
    m_data.C = C;
    m_data.From = From;
    m_data.To = To;
    m_data.Step = Step;

    CalculationResultModel& calcModel = CalculationResultModel::getInstance();

    if(!FromLoad)
    {

        calcModel.clearModel();
    }
    else {
        m_data.From = From + calcModel.rowCount(QModelIndex())*Step;
    }



    m_calculator = new Calculator(m_data);

    m_calculator->moveToThread(m_calcThread);

    connect(m_calcThread, SIGNAL(started()), m_calculator, SLOT(calculate()));
    connect(m_calculator, SIGNAL(functionCalculated(QPointF)), this, SLOT(functionCalculated(QPointF)));
    connect(m_calculator, SIGNAL(calculationFinished()), this, SLOT(calculationFinished()));

    m_calcThread->start();
}

void CalculateManager::calcPause()
{
    m_calculator->pause();
}

void CalculateManager::calcBreak()
{
    m_calculator->cancel();
}

calcData CalculateManager::getCurrentCalcData()
{
    return m_data;
}

void CalculateManager::calculationFinished()
{
    m_calcThread->quit();
    m_calcThread->deleteLater();

    if(m_calculator) delete m_calculator;

    emit calculationFinishedToQml();
}

void CalculateManager::functionCalculated(QPointF value)
{
    emit functionCalculatedSignal(value);
}

