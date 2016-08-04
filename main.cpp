#include <QApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>
#include "main.h"

#define QML_EXAMPLE_SURFACE_ID 3

QObject *object;
static bool flaga_programu = false;

int main(int argc, char *argv[])
{
    setenv("QT_QPA_PLATFORM", "wayland", 1); // force to use wayland plugin
    setenv("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1", 1);

    QGuiApplication app(argc, argv);
    QQuickView view(QUrl(QStringLiteral("qrc:/main.qml")));
    object = (QObject *)view.rootObject();

    MyClass myClass;
    QObject::connect(object, SIGNAL(qmlSignal(QString)),
                     &myClass, SLOT(cppSlot(QString)));

    QObject::connect(object, SIGNAL(arrowUpSignal()),
                     &myClass, SLOT(arrowUpAction()));

    QObject::connect(object, SIGNAL(arrowDownSignal()),
                     &myClass, SLOT(arrowDownAction()));

    if(flaga_programu == false){
        myClass.initializeCurrentPath();
        flaga_programu = true;
    }


    view.setProperty("IVI-Surface-ID", QML_EXAMPLE_SURFACE_ID);
    view.show();

    return app.exec();
}

