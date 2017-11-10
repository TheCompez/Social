//
//  File : intergrate.cpp
//  Class or Function (Intergrate)
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//


#include "intergrate.h"

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

Intergrate::Intergrate()
{

}

//Open app directly
void Intergrate::telegram (const QString &domain)
{

#if defined(OS_MOBILE)
  QDesktopServices::openUrl(QUrl("tg://resolve?domain=" + domain));
#elif defined(OS_DESKTOP)
  QDesktopServices::openUrl(QUrl("tg://resolve?domain=" + domain));
#endif


}
void Intergrate::callPhone (const QString &number)
{

  QDesktopServices::openUrl(QUrl("tel://" + number));

}
void Intergrate::promptCallPhone (const QString &number)
{

  QDesktopServices::openUrl(QUrl("telprompt://" + number));

}
void Intergrate::sendSMS (const QString &number)
{

#if defined (OS_MOBILE_IOS)
  QDesktopServices::openUrl(QUrl("sms://" + number));
#elif defined(OS_MOBILE_ANDROID)
  QDesktopServices::openUrl(QUrl("sms:" + number));
#else
  QDesktopServices::openUrl(QUrl("sms://" + number));
#endif

}
void Intergrate::sendEmail (const QString &address)
{

  QDesktopServices::openUrl(QUrl("mailto:" + address));

}

//Sharing method

void Intergrate::shareTelegram (const QString &content)
{

#if defined(OS_MOBILE)
  QDesktopServices::openUrl(QUrl("tg://msg_url?url=" + content));
#elif defined(OS_DESKTOP)
  QDesktopServices::openUrl(QUrl("tg://msg_url?url=" + content));
#endif

}
void Intergrate::shareTweet (const QString &content)
{

  QDesktopServices::openUrl(QUrl("https://twitter.com/home?status=" + content));

}
void Intergrate::shareFacebook   (const QString &content)
{

  QDesktopServices::openUrl(QUrl("https://www.facebook.com/sharer/sharer.php?u=" + content));

}
