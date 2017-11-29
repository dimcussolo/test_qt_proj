import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Loader {
        anchors.fill: parent
        source: {
            "file:" + applicationDirPath + "/MyWidget.qml"
        }
        onLoaded: {
            console.log("MyWidget.qml loaded")
        }
    }
}
