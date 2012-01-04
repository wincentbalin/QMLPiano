import QtQuick 1.0

Rectangle {
    width: 360
    height: 360

    property real octaveMargin: 30

    signal octaveIncreased()
    signal octaveDecreased()

    Flickable {
        id: flickable
        anchors.fill: parent
        flickableDirection: Flickable.HorizontalFlick

        OctaveKeys {
            id: octave
            x: octaveMargin
            y: octaveMargin
            width: parent.width - octaveMargin * 2
            height: parent.height - octaveMargin * 2
        }

        onFlickStarted: {
            if(flickingHorizontally) {
                if(horizontalVelocity < 0) {
                    octaveDecreased()
                    console.log("Octave decreased")
                }
                else {
                    octaveIncreased()
                    console.log("Octave increased")
                }
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
