import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import "content"
import "qrc:///shared"
import EventAppData 1.0

EASelectListForm {  
    addListBut.onClicked: {
        eaContainer.insertEmptyItemList(0, newListName.text);
    }
}


