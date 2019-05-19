import QtQuick 2.0

Rectangle
{
    border.color: "black"
    border.width: 1
    color: "green"

    ListView
    {
        anchors.fill: parent
        snapMode: ListView.NoSnap
        boundsBehavior: Flickable.DragAndOvershootBounds

        header: ResultPageHeader{
            anchors.left: parent.left
            anchors.right: parent.right
        }

        delegate: ResultPageDelegate{
            anchors.left: parent.left
            anchors.right: parent.right
        }

        model:resultModel
    }
}
