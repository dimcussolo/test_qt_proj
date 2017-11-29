#include "testplug.h"
#include "mytime.h"
#include <qqml.h>

void TestPlug::registerTypes(const char *uri)
{
    qmlRegisterType<MyTime>(uri, 1, 0, "MyTime");
}

