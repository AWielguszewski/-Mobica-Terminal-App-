
import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id: window
    visible: true
    width: 1920
    height: 1080
    color:"#131314"

    signal qmlSignal(string msg)
    signal arrowUpSignal()
    signal arrowDownSignal()

    Rectangle {
        id: rectangle1
        x: 210
        y: 169
        width: 1500
        height: 885
        color:"black"
        radius: 30
        border.width: 1
        border.color: "#F2EFED"
    }

    Flickable{
        x: 261
        y: 274
        width: 1400
        height: 750
        clip: true
        interactive: true
        contentHeight: text1.height
        contentWidth: text1.width
        boundsBehavior: Flickable.StopAtBounds
        Text {
            id:text1
            objectName: "txt"
            width: 1400
            color: "#a29d9d"
            font.pointSize: 15
            styleColor: "#0d0000"
            horizontalAlignment: Text.AlignLeft
        }
    }


    Rectangle {
        id: rectangle2
        x: 460
        y: 76
        width: 1000
        height: 50
        radius: 20
        rotation: 0
        transformOrigin: Item.Center
        color: "#000000"
        border.width: 1
        border.color: "#F2EFED"
    }

    TextInput {
        id: textInput1
        objectName: "txtIN"
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
        Keys.onPressed: {
            if(event.key === Qt.Key_Up){
                event.accepted = true
                window.arrowUpSignal()
            }
            if(event.key === Qt.Key_Down){
                event.accepted = true
                window.arrowDownSignal()
            }
        }
    }

    Text {
        id: text2
        x: 460
        y: 79
        width: 90
        height: 50
        text: qsTr(">_")
        style: Text.Outline
        font.family: "Verdana"
        styleColor: "#fdfdfd"
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
        color: "#1c3ad1"
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
        color: "#ffffff"
        text: qsTr("")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20
    }




}
