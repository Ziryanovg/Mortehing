#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "calculatemanager.h"
#include "Model/calculationresultmodel.h"
#include "filemanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    CalculateManager& calcMgn = CalculateManager::getInstance();

    CalculationResultModel& resultModel = CalculationResultModel::getInstance();

    FileManager& fileMgn = FileManager::getInstance();

    engine.rootContext()->setContextProperty("CalcMgn",&calcMgn);
    engine.rootContext()->setContextProperty("resultModel",&resultModel);
    engine.rootContext()->setContextProperty("FileMgn",&fileMgn);
    QObject::connect(&CalculateManager::getInstance(), SIGNAL(functionCalculatedSignal(QPointF)), &resultModel, SLOT(add(QPointF)));


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
