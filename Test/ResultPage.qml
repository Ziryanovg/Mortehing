import QtQuick 2.0

Rectangle
{
    border.color: "black"
    border.width: 1
    color: "green"

    ListView
    {
        anchors.fill: parent

        header: ResultPageHeader{}

        delegate: ResultPageDelegate{}

        model:resultModel
    }
}
