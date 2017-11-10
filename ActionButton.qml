//
//  File : ActionButton.qml
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//

import QtQuick 2.9

Rectangle {

    property string icon;
    property string icon_color;

    signal sendSignal;

    width: 72
    height: 72
    radius: 48
    color: "#fff"
    border.width: 1
    border.color: "#f2f2f2"


    Text {

        font.family: awesome.name
        font.pixelSize: 38
        font.weight: Text.Fit
        anchors.centerIn: parent
        text: icon
        color: icon_color

        scale : eventArea.containsPress ? 0.7 : 1.0

        Behavior on scale {
            NumberAnimation {
                duration: 100
            }
        }
    }


    MouseArea {
        id:eventArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: sendSignal();
    }


}
