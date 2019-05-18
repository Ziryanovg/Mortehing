import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.calendar 1.0
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 1200
    height: 480
    title: qsTr("Test")

    Connections
    {
        target: CalcMgn

        onFunctionCalculatedSignal:
        {
            progressBar.value++
        }
    }

    WorkPage
    {
        id: workPage
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        width: 400
        anchors.bottom: rectBar.top
        anchors.bottomMargin: 5

        onCalculationStarted:
        {
            progressBar.to = maxValue - minValue
        }
    }

    ResultPage
    {
        id: resultPage
        width: 200
        anchors.bottom: rectBar.top
        anchors.bottomMargin: 5
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
        anchors.bottom: rectBar.top
        anchors.bottomMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

    }

    Rectangle
    {
        id:rectBar
        height: 30
        border.width: 1
        border.color: "black"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        ProgressBar
        {
            id:progressBar
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.fill: parent

        }
    }
}
