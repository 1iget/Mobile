import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import "qrc:///shared"

Item {
    id: formatedListPanel
    width: 1100; height: 800;
    //property alias listTypeCombo: listTypeCombo
    property alias thisItemList: thisItemList
    property alias listItemEntryStack: listItemEntryStack
    property alias thisFormatedListPanel: thisFormatedListPanel
    property alias formatedListPanel: formatedListPanel
    property alias ldpEventAppPage: ldpEventAppPage
    Row {
        width: 1100; height: 700
        Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
        spacing: 10
        x:10; y:10
        Column {
           // width: 1100; height: 700
            //anchors.top: myRect.anchors.bottom
/*           Rectangle {
                x:10
                id: myRect
                width: 500; height: 50
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                border.width : 2; border.color : "blue"
                visible: listItemEntryStack.currentIndex >1
                ComboBox {
                    id: listTypeCombo
                    width: 500; height: 50
                    //height: listItemEntryStack.currentIndex >1 ? 50 : 0
                    visible: listItemEntryStack.currentIndex >1
                    //currentIndex: 0
                    //currentIndex: eaListDisplayPage.featuredList.formatedList ? 0 : 1
                    model: [
                        qsTr("Formated list from csv"),
                        qsTr("Manual creation"),
                    ]
                }//ComboBox
            }  *///Rectangle
            clip: true
            Rectangle {
                id: rectSL
                width: 520; height: 720
                border.width : 1; border.color : "green"
                //y: 300
                StackLayout {
                    id: listItemEntryStack
                    x:10; y: 10

                    width: 500; height: 700
                    clip: true
                    property int formatedListStack: 2
                    property int manualListItem: 3

                    AddNewList {
                        width: 200; height: 200
                        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    }
                    EaldFormatedList {
                        id: thisFormatedListPanel
                    }
                    EaldList {
                        id: thisItemList
                    }
                    Rectangle {
                        color: 'blue'
                        implicitWidth: 200
                        implicitHeight: 200
                    }
                    Rectangle {
                        color: 'green'
                        implicitWidth: 200
                        implicitHeight: 200
                    }

                } //StackLayout
            }  //Rectangle
       } //ColumnLayout

        Rectangle {
            id: dataBox
            width: 520; height: 720
            border.width : 0.5; border.color : "black"
            clip: true
            EventAppPage {
                x:10; y:10
                width: parent.width-20; height: parent.height-20
                id: ldpEventAppPage
            }
        } //Rectangle
    } //RowLayout

} //Item










































