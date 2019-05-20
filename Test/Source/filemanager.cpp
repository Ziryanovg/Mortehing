#include "filemanager.h"
#include <QFile>
#include <QTextStream>
#include "Model/calculationresultmodel.h"

FileManager::FileManager(QObject *parent) : QObject(parent)
{

}

FileManager &FileManager::getInstance()
{
    static FileManager instance;
    return instance;
}

int FileManager::save(qint32 newFunctionIndex,qreal newA,qreal newB,qreal newC,qreal newFrom,qreal newTo, qreal newStep)
{
    QFile file("data.txt");

    if(!file.open(QIODevice::WriteOnly)) return 1;

    CalculationResultModel& calcModel = CalculationResultModel::getInstance();

    QTextStream stream(&file);

    stream << newFunctionIndex << endl;
    stream << newA << endl;
    stream << newB << endl;
    stream << newC << endl;
    stream << newFrom << endl;
    stream << newTo << endl;
    stream << newStep << endl;

    for (auto i=0;i<calcModel.rowCount(QModelIndex());i++) {
        stream << calcModel.getItem(i).y() << endl;
    }

    file.close();

    return 0;
}

int FileManager::load()
{
    QFile file("data.txt");

    if(!file.open(QIODevice::ReadOnly)) return 1;

    QTextStream stream(&file);

    int index = stream.readLine().toInt();
    float valueA = stream.readLine().toFloat();
    float valueB = stream.readLine().toFloat();
    float valueC = stream.readLine().toFloat();
    float valueFrom = stream.readLine().toFloat();
    float valueTo = stream.readLine().toFloat();
    float valueStep = stream.readLine().toFloat();

    CalculationResultModel& calcModel = CalculationResultModel::getInstance();

    calcModel.clearModel();

    float from = valueFrom;

    while (!stream.atEnd()) {
        QPointF point(from,stream.readLine().toFloat());
        calcModel.add(point);
        from+=valueStep;
    }

    emit fileLoad(index,valueA,valueB,valueC,valueFrom,valueTo,valueStep, calcModel.rowCount(QModelIndex()));

    return 0;
}
