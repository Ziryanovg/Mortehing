import QtQuick 2.0
import QtQuick.Window 2.12

Rectangle
{
    border.width: 1
    border.color: "black"

    property var ctx

    function paintFunction()
    {
        var count = resultModel.rowCount();

        if(count===0) return

        ctx.beginPath();

        ctx.strokeStyle = Qt.rgba(0, 255, 0, 1);

        for (var i = 0; i < count-1; i++) {
            ctx.moveTo(resultModel.getItem(i).x+canva.width/2, canva.height/2 - resultModel.getItem(i).y)
            ctx.lineTo(resultModel.getItem(i+1).x+canva.width/2, canva.height/2 - resultModel.getItem(i+1).y)
        }

        ctx.stroke()
    }


    Connections
    {
        target: CalcMgn

        onFunctionCalculatedSignal:
        {
            canva.requestPaint()
        }
    }

    Canvas
    {
        id:canva
        anchors.rightMargin: 1
        anchors.leftMargin: 1
        anchors.bottomMargin: 1
        anchors.topMargin: 1
        anchors.fill: parent

        onAvailableChanged:
        {
            ctx = canva.getContext('2d')
        }

        onPaint:
        {
            ctx.reset()
            ctx.clearRect(0,0,width,height);
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1);
            ctx.lineWidth = 1;
            ctx.beginPath();
            ctx.moveTo(0, canva.height/2);
            ctx.lineTo(canva.width,canva.height/2)
            ctx.moveTo(canva.width/2, 0);
            ctx.lineTo(canva.width/2,canva.height)

            ctx.stroke();

            paintFunction()


        }
    }

    Loader {
            id: winld
            active: false
            sourceComponent: Window {
                width: 300
                height: 400
                visible: true

                ResultPage{anchors.fill: parent}

                onVisibleChanged: if(!visible) winld.active = false
            }
        }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            winld.active = true
        }
    }
}
