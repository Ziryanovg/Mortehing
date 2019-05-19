#include "calculationresultmodel.h"
#include <QDebug>

CalculationResultModel::CalculationResultModel(QObject *parent) : QAbstractListModel(parent)
{

}

int CalculationResultModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant CalculationResultModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case valueX:
    {

        return m_data.at(index.row()).x();
    }
    case valueY:
    {
        return m_data.at(index.row()).y();
    }
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CalculationResultModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[valueX] = "valueX";
    roles[valueY] = "valueY";
    return roles;
}

QPointF CalculationResultModel::getItem(qint32 index)
{
    if(m_data.size() >= index)
        return m_data.at(index);
}

void CalculationResultModel::add(QPointF point)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(point);
    endInsertRows();

    emit dataChanged(createIndex(0, 0), createIndex(m_data.size()-1, 0));
}

void CalculationResultModel::clearModel()
{
    m_data.clear();
}

