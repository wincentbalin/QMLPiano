import QtQuick 1.0
import QMLPiano 1.0

Item {
    id: root

    width: 360
    height: 360

    signal noteOn(int note)
    signal noteOff(int note)

    // Positioning
    property real spacing: 5

    Piano {
        id: piano
//        on
    }

    Connections {
//
    }

    Flickable {
        id: flickable

        width: parent.width
        height: parent.height * 0.8

        flickableDirection: Flickable.HorizontalFlick

        OctaveKeys {
            id: octave
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            anchors.topMargin: spacing
            anchors.leftMargin: spacing
            anchors.rightMargin: spacing
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


    /*
    Text {
        anchors.centerIn: parent
        text: "Hello World"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(color == "white")
                color = "black"
            else
                color = white
            //Qt.quit();
        }
    } */
}

/*
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 360
    height: 360
    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
}
*/
