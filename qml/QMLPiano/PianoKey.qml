import QtQuick 1.0

Item {
    id: pianoKey

    width: parent.keyWidth
    height: parent.keyHeight

    signal pushed(int index)
    signal released(int index)

    property alias normalStateSource: normal.source
    property url pressedStateSource
    property url downStateSource: pressedStateSource

    property bool down: false

    property int fadeDuration: 50

    property string name: "dangling"
    property int keyCode: Qt.Key_Space
    property int keyIndex: -256

    Image {
        id: normal

        anchors.centerIn: parent
        width: (parent.width == 0) ? sourceSize.width : parent.width
        height: (parent.height == 0) ? sourceSize.height : parent.height
        fillMode: Image.Stretch
        smooth: true

        opacity: (mouse.pressed || down) ? 0.8 : 1
        visible: opacity > 0.8

        Behavior on opacity {
            PropertyAnimation {
                properties: "opacity"
                easing.type: Easing.OutQuart
                duration: pianoKey.fadeDuration
            }
        }
    }

    Image {
        id: pressed

        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        fillMode: Image.Stretch
        smooth: true

        opacity: (source != "" && (mouse.pressed || down)) ? 1 : 0
        visible: opacity > 0

        source: down ? pianoKey.downStateSource : pianoKey.pressedStateSource
        Behavior on opacity { PropertyAnimation { properties: "opacity"; easing.type: Easing.OutQuart; duration: pianoKey.fadeDuration } }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onPressed: {
            pianoKey.pushed(keyIndex)
            console.debug(name + " pressed")
        }
        onReleased: {
            pianoKey.released(keyIndex)
            console.debug(name + " released")
        }
    }
}
