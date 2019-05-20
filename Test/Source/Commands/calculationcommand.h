#ifndef CALCULATIONCOMMAND_H
#define CALCULATIONCOMMAND_H

#include <QPointF>

class CalculationCommand
{
public:
    virtual ~CalculationCommand() = default;

    virtual qreal calculate(qreal x,qreal A, qreal B, qreal C=0)=0;
};

#endif // CALCULATIONCOMMAND_H
