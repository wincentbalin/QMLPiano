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

class Piano : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int octave READ octave WRITE setOctave NOTIFY octaveChanged)
    Q_PROPERTY(QString portName READ portName NOTIFY portNameChanged)
public:
    Piano() : octave_(0) { initMIDI(); }
    ~Piano() { cleanupMIDI(); }
    int octave() const { return octave_; }
signals:
    void octaveChanged(int);
    void portNameChanged();
public:
    void setOctave(int octave) { octave_ = octave; emit octaveChanged(octave_); }
    QString portName() const { return portName_; }
public slots:
    void noteOn(int keyIndex);
    void noteOff(int keyIndex);
private:
    void initMIDI();
    void cleanupMIDI();
    int key2midi(int index);
    void sendNoteMessage(unsigned char status, int keyIndex, unsigned char velocity);

    int octave_;
    RtMidiOut* midiOut_;
    QString portName_;
};

#endif // QMLPIANO_HPP
