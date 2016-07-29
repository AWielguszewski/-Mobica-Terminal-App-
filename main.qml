
import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id: window
    visible: true
    width: 1920
    height: 1080
    color:"#131314"

    signal qmlSignal(string msg)



        Rectangle {
            id: rectangle1
            x: 210
            y: 169
            width: 1500
            height: 885
            color:"black"
            radius: 30
            border.width: 2
            border.color: "#F2EFED"
        }

        Text {
            id:text1
            objectName: "txt"
            x: 0
            y: 0
            width: 1400
            height: 750
            color: "#e6e6e6"
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.pointSize: 15
            styleColor: "#0d0000"
            anchors.left: parent.left
            anchors.leftMargin: 260
            anchors.top: parent.top
            anchors.topMargin: 275
            horizontalAlignment: Text.AlignLeft
        }


        Rectangle {
            id: rectangle2
            x: 460
            y: 76
            width: 1000
            height: 50
            radius: 20
            color: "#000000"
            border.width: 2
            border.color: "#F2EFED"
        }

        TextInput {
            id: textInput1
            x: 550
            y: 87
            width: 910
            height: 50
            color: "#ffffff"
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 25
            onAccepted: {
                window.qmlSignal(text);
                text = "";
            }
        }

        Text {
            id: text2
            x: 460
            y: 76
            width: 90
            height: 50
            color: "#bf5a08"
            text: qsTr(">_")
            horizontalAlignment: Text.AlignHCenter
            transformOrigin: Item.Center
            font.bold: true
            font.pixelSize: 35
        }

        Text {
            id: text3
            objectName: "txt2"
            x: 260
            y: 199
            width: 200
            height: 50
            color: "#18ab0f"
            text: qsTr("")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
        }

        Text {
            id: text4
            objectName: "txt3"
            x: 466
            y: 199
            width: 1195
            height: 50
            color: "#d3be11"
            text: qsTr("")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
        }




}
