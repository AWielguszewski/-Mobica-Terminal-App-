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

private:
    QString msgTable[100];
    int msgTableCurrentPosition = 0;
    int msgTablePopulation = 0;
    QString currentPath;

    void addToTable(QString msg){
        msgTable[msgTableCurrentPosition] = msg;
        msgTableCurrentPosition++;
        msgTablePopulation++;
    }

public:
    void initializeCurrentPath(){
        QProcess process;
        QString command;

        command.append("pwd | cat > /Data/currentPath.txt");
        process.start("/bin/sh", QStringList() << "-c" << command);

        process.waitForFinished();
        process.close();

        setCurrentPath();
        qDebug() << "Initializing current path";
    }

public slots:
    void cppSlot(const QString &msg){
        //uruchomienie skryptu
        QProcess process;
        QString command;

        msgTableCurrentPosition = msgTablePopulation;
        addToTable((QString)msg);

        command.append("cd " + currentPath + "; ");
        if(msg[0] == 'c' && msg[1] == 'd')
            command.append(msg);
        else
            command.append(msg + " | cat > /Data/ifOutput.txt");
        command.append("; pwd | cat > /Data/currentPath.txt");
        process.start("/bin/sh", QStringList() << "-c" << command);

        process.waitForFinished();
        process.close();

        setCurrentPath();

        //odczytanie danych wyjsciowych skryptu z pliku
        QFile file("/Data/ifOutput.txt");
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

    void arrowUpAction(){
        if(msgTableCurrentPosition > 0){
            msgTableCurrentPosition--;
            QObject *txtIn = object->findChild<QObject*>("txtIN");
            if (txtIn)
                txtIn->setProperty("text", msgTable[msgTableCurrentPosition]);
        }
    }

    void arrowDownAction(){
        if(msgTableCurrentPosition < msgTablePopulation){
            msgTableCurrentPosition++;
            QObject *txtIn = object->findChild<QObject*>("txtIN");
            if (txtIn)
                txtIn->setProperty("text", msgTable[msgTableCurrentPosition]);
        }
    }

    void setCurrentPath(){
        QFile file("/Data/currentPath.txt");

        if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
            QTextStream stream(&file);
            while (!stream.atEnd()){

                currentPath = stream.readLine();
            }
            QObject *currPath = object->findChild<QObject*>("currPath");
            if (currPath)
                currPath->setProperty("text", currentPath);
        }
        file.close();
    }
};

#endif // MAIN_H
