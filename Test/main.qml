import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Test")

    WorkPage
    {
        id: workPage
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        width: 400
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }

    ChartPage
    {
        id: chartPage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: workPage.right
        anchors.leftMargin: 0

    }
}
