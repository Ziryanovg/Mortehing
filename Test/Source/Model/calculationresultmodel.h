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

    static CalculationResultModel& getInstance();

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE QPointF getItem(qint32 index);
    void clearModel();

protected:
    explicit CalculationResultModel(QObject *parent = nullptr);
    CalculationResultModel(const CalculationResultModel&){}
    CalculationResultModel& operator=(CalculationResultModel&);

signals:

public slots:
    void add(QPointF point);


private:
    QList<QPointF> m_data;

};

#endif // CALCULATIONRESULTMODEL_H
