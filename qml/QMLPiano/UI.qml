import QtQuick 1.0
import QMLPiano 1.0

Item {
    id: root

    width: 360
    height: 360

    // Positioning
    property real spacing: 5

    Piano {
        id: piano
    }

    Flickable {
        id: flickable

        width: parent.width
        height: parent.height * 0.9

        flickableDirection: Flickable.HorizontalFlick

        OctaveKeys {
            id: octave
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: spacing
            anchors.leftMargin: spacing
            anchors.rightMargin: spacing

            width: parent.width
            height: root.height * 0.8

            onKeyPushed: piano.noteOn(keyIndex)
            onKeyReleased: piano.noteOff(keyIndex)
        }

        Item {
            id: octaveNumber

            width: root.width
            height: root.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: octave.bottom

            Image {
                id: octaveNumberBackground
                anchors.fill: parent
                anchors.margins: spacing
                source: "images/Arrows.svg"
            }

            Text {
                id: octaveNumberLabel
                anchors.centerIn: parent
                font.pointSize: parent.height - spacing
                text: "Octave: " + piano.octave
            }
        }

        onFlickStarted: {
            if(flickingHorizontally) {
                if(horizontalVelocity < 0)
                    piano.octave = piano.octave - 1
                else
                    piano.octave = piano.octave + 1
            }
        }
    }

    Item {
        id: midiOut

        height: root.height * 0.1
        anchors.top: flickable.bottom
        anchors.left: root.left
        anchors.leftMargin: spacing

        Text {
            id: midiOutLabel
            anchors.bottom: parent.bottom
            anchors.bottomMargin: spacing
            font.pointSize: parent.height / 3
            text: "MIDI Out: " + piano.portName
        }
    }
}
