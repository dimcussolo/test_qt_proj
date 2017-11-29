#include "otherplug.h"
#include "mydate.h"
#include <qqml.h>

void OtherPlug::registerTypes(const char *uri)
{
    qmlRegisterType<MyDate>(uri, 1, 0, "MyDate");
}

