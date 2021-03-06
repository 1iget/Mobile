import QtQuick 2.7
import QtQuick.Layouts 1.3
//For 5.7 to 5.8 switch around QtQuickControls 2.1 and 2.0
//import QtQuick.Controls 2.1
import QtWebView 1.1
import QtQuick.Controls 2.0
import QtLocation 5.6
import QtPositioning 5.6
import QtQuick.Extras 1.4
import "dataList.js" as DataListJS

Item {
    //Text{ text: "Whats up folks!"}

    // Create a property to contain the visibility of the details.
    // We can bind multiple element's opacity to this one property,
    // rather than having a "PropertyChanges" line for each element we
    // want to fade.
    property real detailsOpacity : 0
    width: dataListImage.width
    Layout.fillWidth: true
    height: eaContainer.eaConstruction.display.height
    property alias background: background
    //property alias map: map
    //property alias largePhotoImage: largePhotoImage
    property alias maDataDelegate: maDataDelegate
    property alias closeBut: closeBut
    property alias photoImage: photoImage
    //property alias bottomText: bottomText
    //property alias questionsModel: questionsModel
    //property alias topText: topText

    // A simple rounded rectangle for the background
    Rectangle {
        id: background
        x: eaContainer.eaConstruction.display.x
        y: eaContainer.eaConstruction.display.y
        width: parent.width - x*2;
        height: parent.height - y*2
        color: eaContainer.eaConstruction.display.colour
        border.color: eaContainer.eaConstruction.display.borderColour
        border.width: eaContainer.eaConstruction.display.borderWidth
        radius: eaContainer.eaConstruction.display.radius
    }
    // This mouse region covers the entire delegate.
    // When clicked it changes mode to 'Details'.  If we are already
    // in Details mode, then no change will happen.
    MouseArea {
        id: maDataDelegate
        anchors.fill: parent
        //onClicked: imageDelegate.state = imageDelegate.state == 'Details' ? "" : "Details";
    }

    // Lay out the page: picture, title and ingredients at the top, and method at the
    // bottom.  Note that elements that should not be visible in the list
    // mode have their opacity set to recipe.detailsOpacity.
    Row {
        id: topLayout
        x: 10; y: 10;
        height: photoImage.height;
        //height: imageDelegate.detailsOpacity === 0 ? photoImage.heigh : 0
        width: parent.width
        spacing: 10
        opacity: !imageDelegate.detailsOpacity
        //visible:  imageDelegate.detailsOpacity !== 1
        clip: true
        Image {
            id: photoImage
            //width: parent.width;  height: parent.height
            x : eaContainer.eaConstruction.display.xImage;
            y : eaContainer.eaConstruction.display.yText;
            fillMode: Image.PreserveAspectFit
            width : eaContainer.eaConstruction.display.imageWidth
            height : eaContainer.eaConstruction.display.imageHeight
            source: picture
            cache: false
        }

        Text {
            id: topText
            font: eaContainer.eaConstruction.display.font
            color: eaContainer.eaConstruction.display.fontColour
            style: eaContainer.eaConstruction.display.textStyle
            styleColor: eaContainer.eaConstruction.display.styleColour
            x: eaContainer.eaConstruction.display.xText
            y: eaContainer.eaConstruction.display.yText
            //verticalAlignment: eaContainer.eaConstruction.display.vAlignment
            //horizontalAlignment: eaContainer.eaConstruction.display.hAlignment
            anchors.leftMargin: 10
            height : eaContainer.eaConstruction.display.imageHeight
            text:  eaLVItemList.items[itemIndex].title;
        }
    }

    PageDisplay {
        width: parent.width - 20
        id: pageDisplay
    }

    // A button to close the detailed view, i.e. set the state back to default ('').
    Button {
        id: closeBut
        z: 0
        y: 10
        //anchors { right: background.right; rightMargin: 10 }
        anchors { right: imageDelegate.right;
                    bottom: imageDelegate.bottom;
                    rightMargin: 10
        }
        opacity: imageDelegate.detailsOpacity
        text: "Close"
        //text: dataDelegate.state === 'Detailszz' ? "Close" : "Open"
        checked: true
        //onClicked: dataDelegate.state === 'Details' ? "Details" : "";
        //onClicked: dataDelegate.state === 'Details' ? "" : "Details";
    }

    states: State {
        id: dldStates
        name: "Details"

        PropertyChanges { target: background; color: "white" }

        PropertyChanges { target: imageDelegate; detailsOpacity: 1; x: 0 } // Make details visible
        PropertyChanges { target: imageDelegate; height: dataListImage.height } // Fill the entire list area with the detailed view

        PropertyChanges { target: topLayout; height: 0 }

        // Move the list so that this item is at the top.
        PropertyChanges { target: imageDelegate.ListView.view; explicit: true; contentY: imageDelegate.y }
        //PropertyChanges { target: imageDelegate.dataListImage.view; explicit: true; contentY: imageDelegate.y }
        // Disallow flicking while we're in detailed view
        PropertyChanges { target: imageDelegate.ListView.view; interactive: false }
        //PropertyChanges { target: imageDelegate.dataListImage.view; interactive: false }
    }

}











































