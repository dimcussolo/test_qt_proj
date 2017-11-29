#ifndef MYTIME_H
#define MYTIME_H

#include <QObject>
#include <QTime>
#include <QBasicTimer>

class MyTime :
        public QObject
{
Q_OBJECT
Q_PROPERTY(int second READ second NOTIFY timeChanged)
Q_PROPERTY(int minute READ minute NOTIFY timeChanged)
Q_PROPERTY(int hour READ hour NOTIFY timeChanged)

public:
    MyTime(QObject* parent = nullptr);
    ~MyTime();

    int second() const { return time_.second(); }
    int minute() const { return time_.minute(); }
    int hour() const { return time_.hour(); }

private:
    QTime time_;
    QBasicTimer timer_;

signals:
    void timeChanged();

protected:
    void timerEvent(QTimerEvent*);

    Q_INVOKABLE QString formatTimeString(const QString& format);
};

#endif // MYTIME_H
