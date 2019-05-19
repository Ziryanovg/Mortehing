#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "calculatemanager.h"
#include "Model/calculationresultmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    CalculateManager& calcMgn = CalculateManager::getInstance();

    CalculationResultModel resultModel;

    engine.rootContext()->setContextProperty("CalcMgn",&calcMgn);
    engine.rootContext()->setContextProperty("resultModel",&resultModel);
    QObject::connect(&CalculateManager::getInstance(), SIGNAL(functionCalculatedSignal(QPointF)), &resultModel, SLOT(add(QPointF)));
    QObject::connect(&CalculateManager::getInstance(), SIGNAL(calculationStarted()), &resultModel, SLOT(clearModel()));


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
