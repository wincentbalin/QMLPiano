#ifndef QMLPIANO_HPP
#define QMLPIANO_HPP

#include <QObject>
#include <QString>
#include <QtDeclarative>

#include "RtMidi.h"

// Platform-dependent sleep routines, taken from an example
#if defined(__WINDOWS_MM__)
  #include <windows.h>
  #define SLEEP( milliseconds ) Sleep( (DWORD) milliseconds )
#else // Unix variants
  #include <unistd.h>
  #define SLEEP( milliseconds ) usleep( (unsigned long) (milliseconds * 1000.0) )
#endif

class Piano : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(int octave READ currentOctave NOTIFY octaveChanged)
public:
    Piano() : octave(0) {}
    int currentOctave() const { return octave; }
signals:
    void octaveChanged(int octave);
public slots:
    void decreaseOctave();
    void increaseOctave();
    void noteOn(int keyIndex);
    void noteOff(int keyIndex);
private:
    int key2midi(int index);

    QString portName;
    int octave;
    RtMidiOut* midiOut;
};

#endif // QMLPIANO_HPP
