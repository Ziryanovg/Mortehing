import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.calendar 1.0

Window {
    id: window
    visible: true
    width: 1200
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

    ResultPage
    {
        id: resultPage
        width: 200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: workPage.right
        anchors.leftMargin: 2

    }

    ChartPage
    {
        id: chartPage
        anchors.left: resultPage.right
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

    }
}
