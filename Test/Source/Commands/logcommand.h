#ifndef LOGCOMMAND_H
#define LOGCOMMAND_H

#include "calculationcommand.h"

class LogCommand :public CalculationCommand
{

public:
    LogCommand()=default;

    float calculate(float x,float A, float B, float C=0) override
    {
        return A*log(B*x);
    }
};

#endif // LOGCOMMAND_H
