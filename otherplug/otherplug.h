#ifndef TESTPLUG_H
#define TESTPLUG_H

#include <QQmlExtensionPlugin>

class OtherPlug : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "OtherPlug_ID")

public:
    void registerTypes(const char *uri);
};

#endif // TESTPLUG_H
