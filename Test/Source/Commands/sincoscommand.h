#ifndef SINCOSCOMMAND_H
#define SINCOSCOMMAND_H

#include "calculationcommand.h"
#include <QtMath>

class SinCosCommand :public CalculationCommand
{

public:
    SinCosCommand()=default;

    qreal calculate(qreal x,qreal A, qreal B, qreal C=0) override
    {
        return A*sin(x)+B*cos(C*x);
    }
};

#endif // SINCOSCOMMAND_H
