//
//  File : ShareButton.qml
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//

import QtQuick 2.9

Rectangle {

    property string icon;
    property string icon_color;
    property string titleType;

    signal sendSignal;

    width: 96
    height: 32
    radius: 48
    color: "#fff"
    border.width: 1
    border.color: "#f2f2f2"

    Row {
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Text {

            font.family: awesome.name
            font.pixelSize: 14
            font.weight: Text.Fit
            text: icon
            color: icon_color

            scale : eventArea.containsPress ? 0.7 : 1.0

            Behavior on scale {
                NumberAnimation {
                    duration: 100
                }
            }
        }


        Text {
            font.pixelSize: 12
            font.weight: Text.Fit
            text: titleType
            color: "#777"
        }

    }


    MouseArea {
        id:eventArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: sendSignal();
    }


}
