#include "calculationresultmodel.h"

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
    case Point:
    {
        return m_data.at(index.row());
    }
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CalculationResultModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Point] = "point";
    return roles;
}

void CalculationResultModel::add(QPointF& point)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    m_data.append(point);
    endInsertRows();

    emit dataChanged(createIndex(0, 0), createIndex(m_data.size()-1, 0));
}

