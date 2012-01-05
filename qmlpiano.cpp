#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "qmlpiano.hpp"


void Piano::decreaseOctave()
{
    octave--;
    emit octaveChanged(octave);
}

void Piano::increaseOctave()
{
    octave++;
    emit octaveChanged(octave);
}

void Piano::noteOn(int keyIndex)
{
}

void Piano::noteOff(int keyIndex)
{
}

int Piano::key2midi(int index)
{
    return (octave + 5) * 12 + index;
}


Q_DECL_EXPORT int main(int argc, char *argv[])
{
#if 0
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/QMLPiano/UI.qml"));
    viewer.showExpanded();
#endif

    QApplication app(argc, argv);
    QDeclarativeView view(QUrl::fromLocalFile("qml/QMLPiano/UI.qml"));
    QObject* item = view.rootObject();

    Piano piano;
//    QObject::connect(item, SIGNAL(destroyed())

    view.show();

    return app.exec();
//    return app->exec();
}
