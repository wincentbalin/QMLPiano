# Add more folders to ship with the application, here
folder_01.source = qml/QMLPiano
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

HEADERS += \
    qmlpiano.hpp \
    RtMidi.h \
    RtError.h

SOURCES += \
    qmlpiano.cpp \
    RtMidi.cpp

OTHER_FILES += \
    README

win32:DEFINES += __WINDOWS_MM__
win32:LIBS += -lwinmm
unix:DEFINES += __LINUX_ALSASEQ__
unix:LIBS += -lasound
unix:LIBS += -lpthread

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

