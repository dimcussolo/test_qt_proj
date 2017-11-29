#include "mydate.h"

MyDate::MyDate(QObject* parent) :
    QObject(parent)
{
    date_ = QDate::currentDate();
}

MyDate::~MyDate()
{

}

QString MyDate::formatDateString(const QString& format)
{
    return date_.toString(format);
}
