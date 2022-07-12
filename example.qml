import QtQuick 2.15
import QtQuick.Window 2.14

Window {id: root
    visible: true
    width: 600
    height: 500
    title: "CustomToolTip example"
    property var currentIndex;
    ListView{
        anchors.centerIn: parent
        height: parent.height;
        model: ListModel{
            ListElement{direction: "left"}
            ListElement{direction: "top"}
            ListElement{direction: "right"}
            ListElement{direction: "bottom"}

        }
        spacing: 20;
        delegate:
            Rectangle{id: rect1
                width: 100;
                height: 50;
                color: "grey"
                Text{text:"hover me"; anchors.centerIn: parent}
                CToolTip{
                    cursorShape: Qt.PointingHandCursor;
                    anchors.fill: parent;
                    text: "Hello wrold!"
                    tipDirection: model.direction
                }
            }
        
    }
}