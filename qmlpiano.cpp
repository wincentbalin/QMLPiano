#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "qmlpiano.hpp"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/QMLPiano/UI.qml"));
    viewer.showExpanded();

    return app->exec();
}
