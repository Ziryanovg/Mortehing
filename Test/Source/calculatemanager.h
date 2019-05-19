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

    Q_INVOKABLE void calcStart(int function_index,float A,float B,float C,float From,float To, float Step);
    Q_INVOKABLE void calcPause();
    Q_INVOKABLE void calcBreak();

private:
    explicit CalculateManager(QObject *parent = nullptr) : QObject(parent){}
    CalculateManager(const CalculateManager&);
    CalculateManager& operator=(CalculateManager&);

    QThread* calcThread;
    Calculator* calculator;

signals:
    void calculationStarted();
    void functionCalculatedSignal(QPointF value);
    void pauseCalculation();
    void calculationFinishedToQml();

public slots:
    void calculationFinished();
    void functionCalculated(QPointF value);
};

#endif // CALCULATEMANAGER_H
