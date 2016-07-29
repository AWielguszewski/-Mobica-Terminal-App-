#ifndef MAIN_H
#define MAIN_H

#include <QString>
#include <QApplication>
#include <QDebug>
#include <QProcess>
#include <QFile>

extern QObject *object;

class MyClass : public QObject
{
    Q_OBJECT

public slots:
    void cppSlot(const QString &msg){
        //uruchomienie skryptu
        QProcess process;
        QString tmp;

        tmp.append(msg + " | cat > /myFiles/ifOutput.txt");
        process.start("/bin/sh", QStringList() << "-c" << tmp);

        process.waitForFinished();
        process.close();

        //odczytanie danych wyjsciowych skryptu z pliku
        QFile file("/myFiles/ifOutput.txt");
        QString line;
        QObject *txt = object->findChild<QObject*>("txt");
        QObject *txt2 = object->findChild<QObject*>("txt2");
        QObject *txt3 = object->findChild<QObject*>("txt3");


        if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
            QTextStream stream(&file);
            while (!stream.atEnd()){

                line.append(stream.readLine()+"\n");
            }
            if (txt)
                txt->setProperty("text", line);
            if (txt2)
                txt2->setProperty("text", "root@raspberrypi: ");
            if (txt3)
                txt3->setProperty("text", msg);
        }
        file.close();
        qDebug() << "Incoming command: " << msg;
    }
};

#endif // MAIN_H
