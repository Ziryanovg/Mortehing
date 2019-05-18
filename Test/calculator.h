#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QDebug>
#include "calculationdata.h"
#include "calculationcommand.h"
#include "quadraticcommand.h"

class Calculator : public QObject
{
    Q_OBJECT
public:
    explicit Calculator(calcData& data, QObject *parent = nullptr);

signals:
    void calculationStarted();
    void calculationFinished();
    void functionCalculated(QPointF value);

public slots:
    void calculate();

private:
    calcData m_data;
    CalculationCommand* command;
};

#endif // CALCULATOR_H
