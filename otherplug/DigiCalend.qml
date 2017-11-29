import QtQuick 2.0
import OtherPlug 1.0

// Item {
    Text {
        id: calendText;
        font {
            bold: true;
            pointSize: 41
        }

        MyDate {
            id: myDate;
            Component.onCompleted: {
                calendText.text = myDate.formatDateString("dd/MM/yyyy");
            }
        }
    }
//}
