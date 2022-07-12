import QtQuick 2.15

Item{id: root;
    property string tipDirection: "right"
    property bool active: _mouseArea.containsMouse
    property alias cursorShape: _mouseArea.cursorShape
    readonly property color black: "#18191c"
    property string text: "";
    property real animationDuration: 400
    anchors.fill: parent;
    MouseArea{id: _mouseArea;
        anchors.fill: parent
        hoverEnabled: true;
        propagateComposedEvents: true;
    }
    Rectangle{
        id: bg
        visible: root.active
        scale: active? 1.0: 0.0
        color: black
        opacity: 0.9
        radius: 5
        width: _textArea.implicitWidth * 1.3
        height: _textArea.implicitHeight * 1.75
        Behavior on scale {
            NumberAnimation{
                duration: animationDuration 
                easing.type: Easing.InOutBack
            }
        }
        // Detail Bottom
        Text{id: _textArea
            text: root.text;
            font.bold: true;
            font.pointSize: 10;
            color: "#E6E6FA";
            anchors.centerIn: parent;
        }
        Rectangle{id: _triangle
            width: 8;
            height: 8;
            rotation: 45;
            color: black
        }
    }

    states: [
        State{
            name: "right"
            when: root.tipDirection == "right"
            PropertyChanges{
                target: bg;
                x: root.x + root.width * 1.2
            }

            AnchorChanges{
                target: bg;
                anchors.verticalCenter: parent.verticalCenter;
            }

            PropertyChanges{
                target: _triangle;
                x: root.x -  _triangle.width / 2
            }

            AnchorChanges{
                target: _triangle;
                anchors.verticalCenter: bg.verticalCenter
            }
        },
        State{
            name: "leftTip"
            when: root.tipDirection == "left"
            PropertyChanges{
                target: bg;
                x: -bg.width
            }

            AnchorChanges{
                target: bg;
                anchors.verticalCenter: parent.verticalCenter;
            }

            PropertyChanges{
                target: _triangle;
                x: bg.width -  _triangle.width / 2
            }

            AnchorChanges{
                target: _triangle;
                anchors.verticalCenter: bg.verticalCenter
            }
        },
        State{
            name: "topTip"
            when: root.tipDirection == "top"
            PropertyChanges{
                target: bg;
                y: -(bg.height * 1.2)
            }

            AnchorChanges{
                target: bg;
                anchors.horizontalCenter: root.horizontalCenter;
            }

            PropertyChanges{
                target: _triangle;
                y: bg.height -  _triangle.width / 2
            }

            AnchorChanges{
                target: _triangle;
                anchors.horizontalCenter: bg.horizontalCenter;
            }
        },
        State{
            name: "bottomTip"
            when: root.tipDirection == "bottom"
            PropertyChanges{
                target: bg;
                y: root.height * 1.2
            }
            AnchorChanges{
                target: bg;
                anchors.horizontalCenter: root.horizontalCenter;
            }
            PropertyChanges{
                target: _triangle;
                y: -  _triangle.width / 2
            }
            AnchorChanges{
                target: _triangle;
                anchors.horizontalCenter: bg.horizontalCenter;
            }
        }
    ]
}
