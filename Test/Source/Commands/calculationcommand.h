#ifndef CALCULATIONCOMMAND_H
#define CALCULATIONCOMMAND_H

#include <QPointF>

class CalculationCommand
{
public:
    virtual ~CalculationCommand() = default;

    virtual float calculate(float x,float A, float B, float C=0)=0;
};

#endif // CALCULATIONCOMMAND_H
