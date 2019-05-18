import QtQuick 2.0

Rectangle
{
    id: rectangle
    width: 200
    height: 30

    border.width: 1
    border.color: "black"


    Text {
        id: textX
        text: valueX
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pointSize: 20
        width: parent.width/2
    }

    Rectangle{
        id: rect
        width: 1
        color: "black"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: textX.right
        anchors.leftMargin: 0
    }

    Text {
        id: textY
        text: valueY
        font.pointSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: rect.right
        anchors.leftMargin: 0
        width: parent.width/2
    }
}
