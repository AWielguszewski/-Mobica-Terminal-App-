TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# deployment path
target.path = /usr/bin

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    main.h
