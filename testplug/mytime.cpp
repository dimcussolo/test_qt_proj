#include "mytime.h"

MyTime::MyTime(QObject* parent) :
    QObject(parent)
{
    time_ = QTime::currentTime();
    timer_.start(1000, this);
}

MyTime::~MyTime()
{

}

void MyTime::timerEvent(QTimerEvent*)
{
    time_ = QTime::currentTime();
    emit timeChanged();
}

QString MyTime::formatTimeString(const QString& format)
{
    return time_.toString(format);
}
