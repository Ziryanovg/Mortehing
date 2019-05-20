#ifndef QUADRATICCOMMAND_H
#define QUADRATICCOMMAND_H

#include "calculationcommand.h"
#include <QtMath>

class QuadraticCommand :public CalculationCommand
{

public:
    QuadraticCommand()=default;

    qreal calculate(qreal x,qreal A, qreal B, qreal C=0) override
    {
        return A*(x*2)+B*x+C;
    }
};

#endif // QUADRATICCOMMAND_H
