#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "qmlpiano.hpp"


void Piano::noteOn(int keyIndex)
{
    unsigned char noteOn = 144; // Note On, first channel
    unsigned char velocity = 100;

    sendNoteMessage(noteOn, keyIndex, velocity);
}

void Piano::noteOff(int keyIndex)
{
    unsigned char noteOff = 128; // Note Off, first channel
    unsigned char velocity = 100;

    sendNoteMessage(noteOff, keyIndex, velocity);
}

void Piano::initMIDI()
{
    // Initialize MIDI object
    midiOut_ = new RtMidiOut("QMLPiano Out");

    // If available, open first MIDI port and get its name
    if(midiOut_->getPortCount() == 0)
    {
        portName_ = "Unavailable";
    }
    else
    {
        midiOut_->openPort();
        portName_ = midiOut_->getPortName().c_str();
    }
}

void Piano::cleanupMIDI()
{
    // Close port
    midiOut_->closePort();

    // Clean up MIDI object
    delete midiOut_;
}

int Piano::key2midi(int index)
{
    // Calculate MIDI note value
    int midiNote = (octave_ + 5) * 12 + index;

    // Ensure values of MIDI note being standard
    if(midiNote < 0)
        midiNote = 0;
    else if(midiNote > 127)
        midiNote = 127;

    return midiNote;
}

// Look up MIDI statuses at http://www.midi.org/techspecs/midimessages.php
void Piano::sendNoteMessage(unsigned char status, int keyIndex, unsigned char velocity)
{
    std::vector<unsigned char> message;

    // Assemble MIDI message
    message.push_back(status);
    message.push_back(key2midi(keyIndex)); // Note
    message.push_back(velocity);

    // Send it
    midiOut_->sendMessage(&message);
}


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Piano>("QMLPiano", 1, 0, "Piano");

    QDeclarativeView view(QUrl::fromLocalFile("qml/QMLPiano/UI.qml"));

    view.show();

    return app.exec();
}
