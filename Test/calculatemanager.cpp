#include "calculatemanager.h"
#include <QDebug>

CalculateManager& CalculateManager::getInstance()
{
    static CalculateManager instance;
    return instance;
}

void CalculateManager::calcStart(int function_index)
{
    qDebug()<< function_index;
}

void CalculateManager::calcPause()
{

}

void CalculateManager::calcBreak()
{

}
