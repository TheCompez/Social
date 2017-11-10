//
//  File : Seprator.qml
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//

import QtQuick 2.0

Row {

    property string title

    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 5

    Rectangle {
        width: 100
        height: 1
        color: "#f2f2f2"
        anchors.verticalCenter: parent.verticalCenter

    }

    Text {
        text: title
        anchors.verticalCenter: parent.verticalCenter
        color: "#ccc"
        font.pixelSize: 14

    }

    Rectangle {
        width: 100
        height: 1
        color: "#f2f2f2"
        anchors.verticalCenter: parent.verticalCenter

    }

}
