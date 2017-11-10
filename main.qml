//
//  File : main.qml
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//

import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

//Import extrenal JavaScript function
import "./Action.js" as JavaScript

//Import external C++ functions
import api.dotwaves.com 1.0


ApplicationWindow {

    id:root
    visible: true
    width: 340
    height: 480
    title: qsTr("Hello World")


    Service {id:service;}
    property string engine : '<font color="#1dacfc"><b>v4 (JavaScript)</b></font>';
    property int engineType : 0; //0 = JavaScript, 1 = C++

    FontLoader {
        id:awesome
        source: "qrc:/font/fontawesome-webfont.ttf"
    }


    Flickable {

        anchors.fill: parent
        contentHeight: root.height * 1.7

        Column {

            id:column
            spacing: 10
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            anchors.bottomMargin: 10


            Row {

                anchors.horizontalCenter: parent.horizontalCenter

                Text {

                    text: "\uf168"
                    font.family: awesome.name
                    font.pixelSize: 32
                    color: "#937ee2"
                    anchors.verticalCenter: parent.verticalCenter

                }

                Text {
                    text: "Cross Platform Sharing App"
                    font.pixelSize: 14
                    color: "#777"
                    anchors.verticalCenter: parent.verticalCenter

                }


            }


            Switch {
                id:methodSwitch
                text: "Enable C++ method (Default JavaScript)";
                font.pixelSize: 12
                font.weight: Text.Fit
                onCheckedChanged: {
                    if(checked) {
                        engine = '<font color="#8870e3"><b>Native (C++)</b></font>';
                        engineType = 1;

                    } else {
                        engine = '<font color="#1dacfc"><b>v4 (JavaScript)</b></font>';
                        engineType = 0;
                    }
                }
            }

            Rectangle {

                anchors.horizontalCenter: parent.horizontalCenter
                height: 32
                width: parent.width
                color: "#f1f1f1"


                Text {
                    id: engineText
                    text: "<b>Engine:</b> " + engine
                    anchors.centerIn: parent
                }

            }

            TextField {
                id:phoneNumber
                width: parent.width
                placeholderText: "989140000000"

            }

            TextField {
                id:emailAddress
                width: parent.width
                placeholderText: "info@example.com"
            }

            TextArea {

                id:messageArea
                width: parent.width
                height: 180
                wrapMode: Text.Wrap
                background: Rectangle { color: "#fff"; border.color: "#f1f1f1"; border.width: 2 }
                anchors.horizontalCenter: parent.horizontalCenter
                text: "This is a sample app for demonstrate open and share your message using by Qt Quick and JavaScript technologies based on C++ and Qt Library.

#KambizAsadzadeh #iostreamir #demo #sample
"


            }

            Seprator {title : "Social Sharing"}

            Row {

                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5

                //Telegram
                ShareButton {
                    icon: "\uf1d8";
                    icon_color: "#4abcfd";
                    titleType:"Telegram";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.shareTelegram(messageArea.text.toString()));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.shareTelegram(messageArea.text.toString()));
                            break;
                        default : 0;

                        }
                    }
                }
                //Twitter
                ShareButton {
                    icon: "\uf099";
                    icon_color: "#1dacfc";
                    titleType:"Twitter";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.shareTweet(messageArea.text.toString()));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.shareTweet(messageArea.text.toString()));
                            break;
                        default : 0;

                        }
                    }
                }
                //Facebook
                ShareButton {
                    icon: "\uf09a";
                    icon_color: "#007ddb";
                    titleType:"Facebook";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.shareFacebook(messageArea.text.toString()));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.shareFacebook(messageArea.text.toString()));
                            break;
                        default : 0;

                        }
                    }
                }

            }

            Seprator {title : "Open App Directly"}


            Grid {

                columns: 3
                rows: 4
                rowSpacing: 5
                columnSpacing: 5
                anchors.horizontalCenter: parent.horizontalCenter

                //Telegram
                ActionButton {
                    icon: "\uf1d8";
                    icon_color: "#4abcfd";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.telegram("dotwaves"));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.telegram("dotwaves"));
                            break;
                        default : 0;

                        }
                    }
                }
                //Direct Mobile
                ActionButton {
                    icon: "\uf10b";
                    icon_color: "#8870e3";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.callPhone(phoneNumber.text));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.callPhone(phoneNumber.text));
                            break;
                        default : 0;

                        }
                    }

                }

                //Prompt Direct Mobile
                ActionButton {
                    icon: "\uf095";
                    icon_color: "#fd7823";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.callPhone(phoneNumber.text));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.callPhone(phoneNumber.text));
                            break;
                        default : 0;

                        }
                    }

                }

                //SMS
                ActionButton {
                    icon: "\uf003";
                    icon_color: "#fd7823";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.sendSMS(phoneNumber.text));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.sendSMS(phoneNumber.text));
                            break;
                        default : 0;

                        }
                    }

                }

                //Email
                ActionButton {
                    icon: "\uf0e0";
                    icon_color: "#62d172";
                    onSendSignal: {

                        switch (engineType) {
                        case 0 :
                            Qt.openUrlExternally(JavaScript.sendEmail(emailAddress.text.toString()));
                            break;
                        case 1 :
                            Qt.openUrlExternally(service.sendEmail(emailAddress.text.toString()));
                            break;
                        default : 0;

                        }
                    }
                }

            }

            Seprator {title : "Footer"}


            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                Text {
                    id: copyright
                    text: "Copyright © 2017 Kambiz Asadzadeh. All rights reserved."
                    font.pixelSize: 10
                    color: "#777"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: link
                    textFormat: Text.RichText
                    text: 'Check out my <font color="#2693e8"><b><a href=\"http://kambizasadzadeh.com\">website</a></b></font>!'
                    onLinkActivated: Qt.openUrlExternally(link)
                    font.pixelSize: 10
                    color: "#777"
                    anchors.horizontalCenter: parent.horizontalCenter

                }
            }
        }
    }
}
