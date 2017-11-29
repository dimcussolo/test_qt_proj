#ifndef MYTIME_H
#define MYTIME_H

#include <QObject>
#include <QDate>

class MyDate :
        public QObject
{
Q_OBJECT
Q_PROPERTY(int day READ day NOTIFY dateChanged)
Q_PROPERTY(int month READ month NOTIFY dateChanged)
Q_PROPERTY(int year READ year NOTIFY dateChanged)

public:
    MyDate(QObject* parent = nullptr);
    ~MyDate();

    int day() const { return date_.day(); }
    int month() const { return date_.month(); }
    int year() const { return date_.year(); }

private:
    QDate date_;

signals:
    void dateChanged();

protected:
    Q_INVOKABLE QString formatDateString(const QString& format);
};

#endif // MYTIME_H
