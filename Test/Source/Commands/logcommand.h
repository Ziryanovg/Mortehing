#ifndef LOGCOMMAND_H
#define LOGCOMMAND_H

#include "calculationcommand.h"
#include <QtMath>

class LogCommand :public CalculationCommand
{

public:
    LogCommand()=default;

    qreal calculate(qreal x,qreal A, qreal B, qreal C=0) override
    {
        return A*log(B*x);
    }
};

#endif // LOGCOMMAND_H
