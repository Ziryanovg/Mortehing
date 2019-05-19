#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QDebug>
#include "calculationdata.h"
#include "calculationcommand.h"
#include "quadraticcommand.h"
#include <QMutex>
#include <QWaitCondition>

class Calculator : public QObject
{
    Q_OBJECT
public:
    explicit Calculator(calcData& data, QObject *parent = nullptr);
    void pause();
    void cancel();


signals:
    void calculationStarted();
    void calculationFinished();
    void functionCalculated(QPointF value);

public slots:
    void calculate();

private:
    QMutex m_continue;
    QWaitCondition m_pauseManager;
    bool m_cancelRequested = false;
    bool m_pauseRequired = false;
    calcData m_data;
    CalculationCommand* command;
};

#endif // CALCULATOR_H
