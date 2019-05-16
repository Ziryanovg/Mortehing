import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle
{
    id: rectangle
    border.width: 1
    border.color: "black"

    Rectangle
    {
        id:rectCombo
        height: 30
        border.width: 1
        border.color: "black"

        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        ComboBox {
            id: cbFx
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            anchors.fill: parent

            model:ComboBoxFxModel{}

            onCurrentIndexChanged: console.log(currentIndex)
        }
    }

    Rectangle {
        id: rectABC
        width: parent.width/2
        color: "#ffffff"
        anchors.bottom: rectBtn.top
        anchors.bottomMargin: 10
        border.width: 1
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: rectCombo.bottom
        anchors.topMargin: 10

        Rectangle
        {
            id:rectInputC
            height: 20
            border.width: 1
            border.color: "black"

            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textC.right
            anchors.leftMargin: 5
            anchors.verticalCenter: textC.verticalCenter

            TextInput {
                id: inputC
                x: 31
                y: 70
                height: 20
                font.pixelSize: 15
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
            }
        }

        Rectangle
        {
            id:rectInputB
            height: 20
            border.color: "black"
            border.width: 1
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textB.right
            anchors.leftMargin: 5
            anchors.verticalCenter: textB.verticalCenter

            TextInput {
                id: inputB
                x: 31
                y: 91
                height: 20
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 15
            }
        }

        Text {
            id: textC
            x: 10
            y: 118
            text: qsTr("С=")
            anchors.top: textB.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: textB.horizontalCenter
            font.pixelSize: 15
        }

        Text {
            id: textB
            x: 10
            y: 94
            text: qsTr("B=")
            anchors.top: textA.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: textA.horizontalCenter
            font.pixelSize: 15
        }

        Rectangle
        {
            id:rectInputA
            height: 20
            border.width: 1
            border.color: "black"
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textA.right
            anchors.leftMargin: 5
            anchors.verticalCenter: textA.verticalCenter

            TextInput {
                id: inputA
                x: 31
                y: 67
                height: 20
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 15
            }
        }

        Text {
            id: textA
            x: 10
            text: qsTr("A=")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            font.pixelSize: 15
        }





    }

    Rectangle {
        id: rectStep
        color: "#ffffff"
        anchors.bottom: rectBtn.top
        anchors.bottomMargin: 10
        border.width: 1
        anchors.left: rectABC.right
        anchors.leftMargin: 5
        anchors.top: rectCombo.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        Text {
            id: textFrom
            text: qsTr("From=")
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pixelSize: 15
        }

        Text {
            id: textTo
            text: qsTr("To=")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: textFrom.bottom
            anchors.topMargin: 10
            font.pixelSize: 15
        }

        Text {
            id: textStep
            text: qsTr("Step=")
            anchors.top: textTo.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pixelSize: 15
        }

        Rectangle {
            id: rectInputFrom
            height: 20
            color: "#ffffff"
            border.width: 1
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textFrom.right
            anchors.leftMargin: 5
            anchors.verticalCenter: textFrom.verticalCenter

            TextInput {
                id: inputFrom
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: rectInputTo
            height: 20
            color: "#ffffff"
            border.width: 1
            anchors.verticalCenterOffset: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: textTo.right
            anchors.leftMargin: 22
            anchors.verticalCenter: textTo.verticalCenter

            TextInput {
                id: inputTo
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 15
            }
        }

        Rectangle {
            id: rectInputStep
            height: 20
            color: "#ffffff"
            anchors.left: textStep.right
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: textStep.verticalCenter
            border.width: 1

            TextInput {
                id: inputStep
                text: qsTr("")
                anchors.rightMargin: 2
                anchors.leftMargin: 2
                anchors.fill: parent
                font.pixelSize: 15
            }
        }
    }

    Rectangle {
        id: rectBtn
        y: 419
        height: 80
        color: "#ffffff"
        border.width: 1
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        RowLayout
        {
            height: 80
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.fill: parent

            Button {
                id: btnStart
                height: 80
                text: qsTr("Start")
                Layout.fillHeight: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0

                onClicked: calcStart()
            }

            Button {
                id: btnPause
                text: qsTr("Pause")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            Button {
                id: btnBreak
                text: qsTr("Break")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    function checkInput(input)
    {
        if(isNaN(Number(input.text)) || input.text === "")
        {
           input.parent.border.color = "red"
           return false
        }
        else
        {
            input.parent.border.color = "black"
            return true
        }
    }


    function calcStart()
    {
        var available = true

        available = checkInput(inputA)


        CalcMgn.calcStart(cbFx.currentIndex)
    }

}

















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2;anchors_height:200}D{i:5;anchors_width:80}
D{i:4;anchors_width:80;anchors_y:70}D{i:7;anchors_width:80}D{i:8;anchors_height:200;anchors_width:80;anchors_y:70}
D{i:9;anchors_height:200;anchors_width:200}D{i:11;anchors_height:200;anchors_width:200}
D{i:10;anchors_height:200;anchors_width:200}D{i:12;anchors_height:200;anchors_width:200}
D{i:3;anchors_height:200;anchors_width:80}D{i:14;anchors_height:200;anchors_width:200}
D{i:15;anchors_height:200;anchors_width:200}D{i:16;anchors_width:200}D{i:18;anchors_width:200}
D{i:17;anchors_height:20;anchors_width:80}D{i:20;anchors_width:200}D{i:19;anchors_height:20;anchors_width:80}
D{i:22;anchors_height:200;anchors_width:200}D{i:21;anchors_height:20;anchors_width:80}
D{i:13;anchors_height:200;anchors_width:200}
}
 ##^##*/
