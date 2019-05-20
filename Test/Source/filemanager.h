#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include "calculatemanager.h"

class FileManager : public QObject
{
    Q_OBJECT
public:
    static FileManager& getInstance();

    Q_INVOKABLE int save(qint32 newFunctionIndex,qreal newA,qreal newB,qreal newC,qreal newFrom,qreal newTo, qreal newStep);
    Q_INVOKABLE int load();

protected:
    explicit FileManager(QObject *parent = nullptr);
    FileManager(const FileManager&);
    FileManager& operator=(FileManager&);

signals:
    void fileLoad(qint32 newFunctionIndex,qreal newA,qreal newB,qreal newC,qreal newFrom,qreal newTo, qreal newStep, int calcedCount);

public slots:
};

#endif // FILEMANAGER_H
