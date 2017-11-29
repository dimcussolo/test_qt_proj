#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("currentDirPath", QDir::currentPath());
    engine.rootContext()->setContextProperty("applicationDirPath", app.applicationDirPath());
    engine.load(QUrl(QStringLiteral("main.qml")));

    return app.exec();
}
