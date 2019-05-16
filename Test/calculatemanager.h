#ifndef CALCULATEMANAGER_H
#define CALCULATEMANAGER_H

#include <QObject>

class CalculateManager : public QObject
{
    Q_OBJECT
public:
    static CalculateManager& getInstance();


    Q_INVOKABLE void calcStart(int function_index);
    Q_INVOKABLE void calcPause();
    Q_INVOKABLE void calcBreak();

private:
    explicit CalculateManager(QObject *parent = nullptr) : QObject(parent){}
    CalculateManager(const CalculateManager&);
    CalculateManager& operator=(CalculateManager&);
signals:

public slots:
};

#endif // CALCULATEMANAGER_H
