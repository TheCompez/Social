//
//  File : Integrate.cpp
//  Class or Function (Integrate)
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//


#include "integrate.h"

#include <QDesktopServices>
#include <QUrl>

using namespace Service;

#if defined Q_OS_ANDROID
#define OS_MOBILE_ANDROID
#endif
#if defined Q_OS_IOS
#define OS_MOBILE_IOS
#endif


#if defined Q_OS_BLACKBERRY || defined Q_OS_ANDROID || defined Q_OS_IOS || defined Q_OS_WP
#define OS_MOBILE
#else
#define OS_DESKTOP
#endif

Integrate::Integrate()
{

}

//Open app directly
void Integrate::telegram (const QString &domain)
{
  
  QDesktopServices::openUrl(QUrl("tg://resolve?domain=" + domain));

}
void Integrate::callPhone (const QString &number)
{

  QDesktopServices::openUrl(QUrl("tel://" + number));

}
void Integrate::promptCallPhone (const QString &number)
{

  QDesktopServices::openUrl(QUrl("telprompt://" + number));

}
void Integrate::sendSMS (const QString &number)
{

#if defined (OS_MOBILE_IOS)
  QDesktopServices::openUrl(QUrl("sms://" + number));
#elif defined(OS_MOBILE_ANDROID)
  QDesktopServices::openUrl(QUrl("sms:" + number));
#else
  QDesktopServices::openUrl(QUrl("sms://" + number));
#endif

}
void Integrate::sendEmail (const QString &address)
{

  QDesktopServices::openUrl(QUrl("mailto:" + address));

}

//Sharing method

void Integrate::shareTelegram (const QString &content)
{
  QDesktopServices::openUrl(QUrl("tg://msg_url?url=" + content));

}
void Integrate::shareTweet (const QString &content)
{

  QDesktopServices::openUrl(QUrl("https://twitter.com/home?status=" + content));

}
void Integrate::shareFacebook   (const QString &content)
{

  QDesktopServices::openUrl(QUrl("https://www.facebook.com/sharer/sharer.php?u=" + content));

}
