import QtQuick 2.0
import TestPlug 1.0

//Item {
    Text {
        id: clockText;
        font {
            bold: true;
            pointSize: 41
        }

        MyTime {
            id: myTime;
            onSecondChanged: {
                clockText.text = myTime.formatTimeString("HH:mm:ss");
            }
        }
    }
//}
