#ifndef SINCOMMAND_H
#define SINCOMMAND_H

#include "calculationcommand.h"

class SinCommand :public CalculationCommand
{

public:
    SinCommand()=default;

    float calculate(float x,float A, float B, float C=0) override
    {
        return A / ( sin(x*x) * B );
    }
};

#endif // SINCOMMAND_H
