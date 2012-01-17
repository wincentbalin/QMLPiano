import QtQuick 1.0

Rectangle {
    width: 300
    height: 250

    property int octaveIndex: 0

    signal keyPushed(int keyIndex)
    signal keyReleased(int keyIndex)

    // Positioning parameters
    property real spacing: 3

    property real keyWidth: (width - spacing) / 7 - spacing
    property real keyHeight: (height - spacing) / 2 - spacing

    property real whiteKeyY: spacing + keyHeight + spacing
    property real blackKeyY: spacing

    property real nextKey: keyWidth + spacing
    property real sharpKey: keyWidth + spacing / 2 - keyWidth / 2

    property real initialX: spacing


    WhiteKey {
        id: keyC
        name: "C"
        keyIndex: 0
        x: initialX
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    BlackKey {
        id: keyCSharp
        name: "C#"
        keyIndex: 1
        x: keyC.x + sharpKey
        y: blackKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyD
        name: "D"
        keyIndex: 2
        x: keyC.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    BlackKey {
        id: keyDSharp
        name: "D#"
        keyIndex: 3
        x: keyCSharp.x + nextKey
        y: blackKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyE
        name: "E"
        keyIndex: 4
        x: keyD.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyF
        name: "F"
        keyIndex: 5
        x: keyE.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    BlackKey {
        id: keyFSharp
        name: "F#"
        keyIndex: 6
        x: keyF.x + sharpKey
        y: blackKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyG
        name: "G"
        keyIndex: 7
        x: keyF.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    BlackKey {
        id: keyGSharp
        name: "G#"
        keyIndex: 8
        x: keyFSharp.x + nextKey
        y: blackKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyA
        name: "A"
        keyIndex: 9
        x: keyG.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    BlackKey {
        id: keyASharp
        name: "A#"
        keyIndex: 10
        x: keyGSharp.x + nextKey
        y: blackKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }

    WhiteKey {
        id: keyB
        name: "B"
        keyIndex: 11
        x: keyA.x + nextKey
        y: whiteKeyY

        onPushed: keyPushed(index)
        onReleased: keyReleased(index)
    }
}
