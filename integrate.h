//
//  File : Integrate.h
//  Class or Function (Integrate)
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//


#ifndef Integrate_H
#define Integrate_H

#include <QObject>
#define INVOKE Q_INVOKABLE

namespace Service {

  class Integrate : public QObject
  {

    Q_OBJECT

  public:
    Integrate();

    //Open app directly
    INVOKE void telegram        (const QString &domain);
    INVOKE void callPhone       (const QString &number);
    INVOKE void promptCallPhone (const QString &number);
    INVOKE void sendSMS         (const QString &number);
    INVOKE void sendEmail       (const QString &address);

    //Sharing method

    INVOKE void shareTelegram   (const QString &content);
    INVOKE void shareTweet      (const QString &content);
    INVOKE void shareFacebook   (const QString &content);

  };

}

#endif // Integrate_H
