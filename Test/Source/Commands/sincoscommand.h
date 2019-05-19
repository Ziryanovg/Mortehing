#ifndef SINCOSCOMMAND_H
#define SINCOSCOMMAND_H

#include "calculationcommand.h"

class SinCosCommand :public CalculationCommand
{

public:
    SinCosCommand()=default;

    float calculate(float x,float A, float B, float C=0) override
    {
        return A*sin(x)+B*cos(C*x);
    }
};

#endif // SINCOSCOMMAND_H
