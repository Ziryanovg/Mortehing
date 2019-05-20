#ifndef SINCOMMAND_H
#define SINCOMMAND_H

#include "calculationcommand.h"
#include <QtMath>

class SinCommand :public CalculationCommand
{

public:
    SinCommand()=default;

    qreal calculate(qreal x,qreal A, qreal B, qreal C=0) override
    {
        return A / ( sin(x*x) * B );
    }
};

#endif // SINCOMMAND_H
