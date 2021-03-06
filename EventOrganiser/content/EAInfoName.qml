import QtQuick 2.6
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import EventAppData 1.0

EAInfoNameForm {
    id: eventNamePane
    textEventName.text: eaContainer.eaInfo.eventName;

    Component.onCompleted: {
        textEventName.activeFocus();
        setEventIcon();
    }

    saveInfo.onClicked: {
        eaContainer.eaInfo.eventName = textEventName.text;
        ldpEventAppPage.resetToTopDrawer();
        appwin.setTitle();
    }

    Connections {
        target: eaContainer
        onEventCleared: {
            textEventName.text = eaContainer.eaInfo.eventName;
            ldpEventAppPage.resetToTopDrawer();
            setEventIcon()
        }
    }

    Connections {
      target: eaContainer
      onEaItemListsChanged: {
          textEventName.text = eaContainer.eaInfo.eventName;
          setEventIcon();
          ldpEventAppPage.resetToTopDrawer();
      }
    }
/*
    newEventButIF.onClicked: {
        eaContainer.clearEvent();
        clearIconButton();
    }
*/
    Connections {
        target: loadToolbarIcon
        onAccepted: {
            eaContainer.addEventIcon(loadToolbarIcon.file, ldpEventAppPage.toolBar.height);
            eaContainer.showEventIcon = true;
            setEventIcon();
            ldpEventAppPage.resetToTopDrawer();
        }
    }

    Connections {
        target: clearToolbarIconBut
        onPressed: {
            eaContainer.clearEventIcon();
            clearIconButton();
        }
    }

    function clearIconButton() {
        eaContainer.showEventIcon = false;
        setEventIcon();
        ldpEventAppPage.resetToTopDrawer();
        eaContainer.eaConstructionChanged(eaContainer.eaConstruction);
    }

    function setEventIcon() {
        var iconPath = "image://listIcons_" + eaContainer.imageVersion;
        iconPath += "/-1";
        iconToolbarImage.source = iconPath;
    }

}




























