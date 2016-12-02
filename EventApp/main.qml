import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import EventAppData 1.0
import "qrc:/shared"

ApplicationWindow {
    id: appwin
    visible: true
    width: 480; height: 640
    title: eaContainer.eaInfo.eventName

    property color backColour: EAConstruction.backColour
    property color foreColour: EAConstruction.foreColour
    property color textColour: EAConstruction.textColour

    Rectangle {
        color: appwin.backColour
        anchors.fill: parent
    }

    EaContainerObj {
        id: eaContainer
    }

    HttpDownload {
        id: httpDownload
        onFinishedDownload: {
            console.log("Download finished");
            eaContainer.loadNewEventApp();
        }
    }

    header: EaToolBar {
        id: toolBar
    }

    footer: EaFooterBar {
        id: footerBar
    }

/*
    StackCtl {
        id: stackCtl
    }
*/


    StackLayout {
      id: stackCtl
      anchors.fill: parent
      property int topDrawerId: 0
      property int loadEventId: 1
      property alias drawerModel: drawerModel
      ListView {
        id: drawerView
        //width: 110
        //height: 160
        anchors.fill: parent
        delegate: ListDelegate {
          id: drawerDelegate
          text: title
        }
        model: ListModel {
          id: drawerModel
        }
      }
      DownloadEvent {
        id: downloadEvent
      }
      Connections {
          target: eaContainer
          onLoadedEventApp: {
              var countItemLists = eaContainer.eaItemLists.length;
              for (var i = 0; i < countItemLists; i++) {
                var newList = Qt.createComponent("qrc:/shared/DataList.qml", stackCtl);
                var itemlist = eaContainer.eaItemLists[i];
                newList.createObject(stackCtl
                             , {"eaItemList": eaContainer.eaItemLists[i]});
                drawerModel.append({
                    "title" : eaContainer.eaItemLists[i].listName
                });
              }
          }
      }
    }

    Settings {
        category: "geometry"
        property alias x: appwin.x
        property alias y: appwin.y
        property alias width: appwin.width
        property alias height: appwin.height
    }

    Settings {
        id: settingsData
        category: "data"
        property string dataFilename: "defaultData"
    }
}
