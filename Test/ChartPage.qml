import QtQuick 2.0

Rectangle
{
    border.width: 1
    border.color: "black"

    Canvas
    {
        id:canva
        anchors.rightMargin: 1
        anchors.leftMargin: 1
        anchors.bottomMargin: 1
        anchors.topMargin: 1
        anchors.fill: parent
    }
}
