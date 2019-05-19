#ifndef QUADRATICCOMMAND_H
#define QUADRATICCOMMAND_H

#include "calculationcommand.h"

class QuadraticCommand :public CalculationCommand
{

public:
    QuadraticCommand()=default;

    float calculate(float x,float A, float B, float C=0) override
    {
        return A*(x*2)+B*x+C;
    }
};

#endif // QUADRATICCOMMAND_H
