
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
    property bool clicked_flag: false

    Rectangle {
        id: rectangle1
        x: 238
        y: 161
        width: 1500
        height: 885
        color: "#000000"
        radius: 0
        opacity: 0.7
        border.width: 1
        border.color: "#80f2efed"
    }

    Flickable{
        x: 289
        y: 266
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
        y: 35
        width: 100
        height: 50
        color: "#000000"
        radius: 0
        opacity: 0.7
        rotation: 0
        transformOrigin: Item.Center
        border.width: 1
        border.color: "#80f3f0ee"
    }

    Text {
        id: text2
        x: 460
        y: 38
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
        x: 288
        y: 191
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
        x: 494
        y: 191
        width: 1195
        height: 50
        color: "#ffffff"
        text: qsTr("")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle3
        x: 567
        y: 35
        width: 900
        height: 50
        color: "#000000"
        radius: 0
        opacity: 0.7
        visible: true
        rotation: 0
        border.width: 1
        transformOrigin: Item.Center
        border.color: "#80f2efed"

        TextInput {
            id: textInput1
            objectName: "txtIN"
            x: 13
            y: 9
            width: 880
            height: 50
            color: "#ffffff"
            antialiasing: true
            cursorVisible: true
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
    }

    Rectangle {
        id: rectangle4
        x: 826
        y: 102
        width: 500
        height: 30
        color: "#000000"
        opacity: 0.2
    }

    Text {
        id: text5
        objectName: "currPath"
        x: 826
        y: 102
        width: 500
        height: 30
        color: "#ffffff"
        text: qsTr("")
        opacity: 0.7
        font.italic: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    Rectangle {
        id: rectangle5
        x: 184
        y: 161
        width: 40
        height: 90
        color: "#000000"
        opacity: 0.1
    }

    Rectangle {
        id: rectangle6
        x: 184
        y: 265
        width: 40
        height: 780
        color: "#000000"
        opacity: 0.1
    }

    Text {
        id: text6
        x: 159
        y: 186
        width: 90
        height: 40
        color: "#f6f6f6"
        text: qsTr("Cmd")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        rotation: -90
        font.pixelSize: 17
    }

    Text {
        id: text7
        x: -186
        y: 636
        width: 780
        height: 40
        color: "#f6f6f6"
        text: qsTr("Output")
        verticalAlignment: Text.AlignVCenter
        rotation: -90
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 17
    }


    Rectangle {
        id: rectangle7
        x: 615
        y: 102
        width: 200
        height: 30
        color: "#000000"
        opacity: 0.2
    }

    Text {
        id: text8
        x: 615
        y: 102
        width: 200
        height: 30
        color: "#ffffff"
        text: qsTr("current path")
        opacity: 0.7
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        font.italic: true
        objectName: "currPath"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 19
    }

    Rectangle {
        id: bgButton
        x: 1782
        y: 1023
        width: 110
        height: 22
        color: "#b30b0b0b"
        border.color: "#4cfbfbfb"
        MouseArea{
            anchors.fill: bgButton
            onClicked: {
                if(window.clicked_flag === false){
                    window.color = "#ffffff";
                    window.clicked_flag = true;
                    rectangle7.opacity = 0.7;
                    rectangle5.opacity = 0.7;
                    rectangle6.opacity = 0.7;
                    rectangle4.opacity = 0.7;
                    rectangle1.opacity = 0.9;
                    rectangle3.opacity = 0.9;
                    rectangle2.opacity = 0.9;
                }
                else{
                    window.color = "#131314";
                    window.clicked_flag = false;
                    rectangle7.opacity = 0.2;
                    rectangle5.opacity = 0.1;
                    rectangle6.opacity = 0.1;
                    rectangle4.opacity = 0.2;
                    rectangle1.opacity = 0.7;
                    rectangle3.opacity = 0.7;
                    rectangle2.opacity = 0.7;
                }
            }
        }
    }

    Text {
        id: text9
        x: 1788
        y: 1019
        width: 100
        height: 30
        color: "#fdfdfd"
        text: "Background color"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 12
    }




}
