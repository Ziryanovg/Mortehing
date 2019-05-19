#ifndef CALCULATIONRESULTMODEL_H
#define CALCULATIONRESULTMODEL_H

#include <QObject>
#include <QAbstractListModel>

class CalculationResultModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
            valueX = Qt::UserRole + 1,
            valueY
        };

    explicit CalculationResultModel(QObject *parent = nullptr);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE QPointF getItem(qint32 index);

signals:

public slots:
    void add(QPointF point);
    void clearModel();

private:
    QList<QPointF> m_data;

};

#endif // CALCULATIONRESULTMODEL_H
