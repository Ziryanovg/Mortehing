import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle
{
    id: rectMain
    border.width: 1
    border.color: "black"

    property bool calcActive: false
    property var functionIndex:0
    property var valueA: 5
    property var valueB: 4
    property var valueC: 3
    property var valueFrom: -100
    property var valueTo: 100
    property var valueStep: 1

    signal calculationStartedToMain(var minValue,var maxValue,var calced)
    signal calculationFinishedToMain()


    Connections
    {
        target:CalcMgn

        onCalculationFinishedToQml:
        {
            calcActive = false
            calculationFinishedToMain()
        }
    }

    Connections
    {
        target:FileMgn

        onFileLoad:
        {
            functionIndex = newFunctionIndex
            valueA = newA
            valueB = newB
            valueC = newC
            valueFrom = newFrom
            valueTo = newTo
            valueStep = newStep
            calculationStartedToMain(valueFrom,valueTo,calcedCount)
            CalcMgn.calcStart(cbFx.currentIndex,inputA.text,inputB.text,inputC.text,inputFrom.text,inputTo.text,inputStep.text,true)
            pauseClick()
        }
    }

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
            enabled: !calcActive
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            anchors.fill: parent
            currentIndex: functionIndex

            model:ComboBoxFxModel{}
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
                enabled: !calcActive
                x: 31
                y: 70
                height: 20
                font.pixelSize: 15
                text: valueC
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
                enabled: !calcActive
                x: 31
                y: 91
                height: 20
                text: valueB
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
                enabled: !calcActive
                x: 31
                y: 67
                height: 20
                text: valueA
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
                enabled: !calcActive
                text: valueFrom
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
                enabled: !calcActive
                text: valueTo
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
                enabled: !calcActive
                text: valueStep
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
        height: 110
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
            id: layoutStart
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 20

            Button {
                id: btnStart
                height: 80
                text: qsTr("Start")
                enabled: !calcActive

                onClicked: calcStart()
            }

            Button {
                id: btnPause
                text: qsTr("Pause")
                enabled: calcActive
                onClicked:
                {
                    pauseClick()
                }
            }

            Button {
                id: btnBreak
                text: qsTr("Break")
                enabled: calcActive

                onClicked: CalcMgn.calcBreak();
            }
        }

        RowLayout {
            id: layoutSave
            anchors.top: layoutStart.bottom
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 60

            Button {
                id: btnSave
                text: qsTr("Save")

                Timer {
                    id:timerSave
                    interval: 1000; running: false; repeat: false
                    onTriggered: btnSave.text = "Save"
                }

                onClicked:
                {
                    var result = FileMgn.save(cbFx.currentIndex,inputA.text,inputB.text,inputC.text,inputFrom.text,inputTo.text,inputStep.text);
                    if(result===0)
                        btnSave.text = "Saved"
                    else
                        btnSave.text = "Error"

                    timerSave.start()
                }
            }

            Button {
                id: btnLoad
                text: qsTr("Load")
                Timer {
                    id:timerLoad
                    interval: 1000; running: false; repeat: false
                    onTriggered: btnLoad.text = "Load"
                }

                onClicked:
                {
                    var result = FileMgn.load();
                    if(result===0)
                    {
                        calcActive = true
                        btnLoad.text = "Loaded"
                    }
                    else
                        btnLoad.text = "Error"

                    timerLoad.start()
                }
            }
        }
    }

    function pauseClick()
    {
        CalcMgn.calcPause();

        if(btnPause.text==="Pause")
            btnPause.text = "Continue"
        else
            btnPause.text = "Pause"
    }


    function checkInput(input)
    {
        if(isNaN(Number(input.displayText)) || input.displayText === "")
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
        if( checkInput(inputA) &&
                checkInput(inputB) &&
                checkInput(inputC) &&
                checkInput(inputFrom) &&
                checkInput(inputTo) &&
                checkInput(inputStep))
        {
            CalcMgn.calcStart(cbFx.currentIndex,inputA.text,inputB.text,inputC.text,inputFrom.text,inputTo.text,inputStep.text,false)
            calculationStartedToMain(inputFrom.text,inputTo.text,0)
            calcActive = true
        }
    }
}



























/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_width:80;anchors_y:70}D{i:3;anchors_height:200;anchors_width:80}
D{i:2;anchors_height:200}D{i:7;anchors_width:80}D{i:9;anchors_height:200;anchors_width:200}
D{i:8;anchors_height:200;anchors_width:80;anchors_y:70}D{i:10;anchors_height:200;anchors_width:200}
D{i:11;anchors_height:200;anchors_width:200}D{i:13;anchors_height:200;anchors_width:200}
D{i:12;anchors_height:200;anchors_width:200}D{i:14;anchors_height:200;anchors_width:200}
D{i:5;anchors_width:80}D{i:16;anchors_width:200}D{i:17;anchors_height:20;anchors_width:80}
D{i:18;anchors_width:200}D{i:20;anchors_width:200}D{i:19;anchors_height:20;anchors_width:80}
D{i:22;anchors_height:200;anchors_width:200}D{i:21;anchors_height:20;anchors_width:80}
D{i:15;anchors_height:200;anchors_width:200}D{i:26;anchors_height:80}D{i:30;anchors_height:100;anchors_width:100}
}
 ##^##*/
