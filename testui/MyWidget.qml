import QtQuick 2.0
import QtQuick.Layouts 1.2
import TestPlug 1.0
import OtherPlug 1.0

Item {
    Rectangle {
        anchors.fill: parent;
        color: "blue";
    }

    Rectangle {
        anchors.centerIn: parent;
        color: "red";
    }

    ColumnLayout {
        anchors.centerIn: parent;
        DigiCalend {
            Layout.alignment: Layout.Center;
        }
        DigiClock {
            Layout.alignment: Layout.Center;
        }
        AltClock {
            Layout.alignment: Layout.Center;
        }
    }

    Component.onCompleted: {

    }
}
