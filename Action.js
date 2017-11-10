//
//  File : Action.js
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//

//Open telegram channel
function telegram(domain) {

    return "tg://resolve?domain=" + domain;

}

//Start a call directly
function callPhone(number) {

    return "tel://" + number;

}

//Prompt the user before making the call
function promptCallPhone(number) {

    return "telprompt://" + number;
}

//Sending SMS
function sendSMS(number) {

    return "sms:" + number;

}

//Sending an email using by default email application
function sendEmail(address) {

    return "mailto:" + address;

}

//Share awesome tweet
function shareTweet(message) {

    return "https://twitter.com/home?status=" + message;

}

//Share in facebook
function shareFacebook(message) {

    return "https://www.facebook.com/sharer/sharer.php?u=" + message;

}

//Share in telegram
function shareTelegram(message) {
    return "tg://msg_url?url=" + message;
}
