#ifndef CALCULATEMANAGER_H
#define CALCULATEMANAGER_H

#include <QObject>
#include <QDebug>
#include "calculator.h"

class CalculateManager : public QObject
{
    Q_OBJECT
public:
    static CalculateManager& getInstance();

    Q_PROPERTY(bool AllowedCalc READ AllowedCalc WRITE setAllowedCalc NOTIFY AllowedCalcChanged)

    Q_INVOKABLE void calcStart(int function_index,float A,float B,float C,float From,float To, float Step);
    Q_INVOKABLE void calcPause();
    Q_INVOKABLE void calcBreak();

    bool AllowedCalc() const{ return m_AllowedCalc;}

private:
    explicit CalculateManager(QObject *parent = nullptr) : QObject(parent){}
    CalculateManager(const CalculateManager&);
    CalculateManager& operator=(CalculateManager&);

    bool m_AllowedCalc;
    QThread* calcThread;
    Calculator* calculator;

signals:
    void AllowedCalcChanged(bool AllowedCalc);

public slots:
    void calculationFinished();
    void functionCalculated(QPointF value);
    void setAllowedCalc(bool AllowedCalc);
};

#endif // CALCULATEMANAGER_H
