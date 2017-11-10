//
//  File : %{Cpp:License:FileName}
//  Class or Function (%{Cpp:License:ClassName})
//
//  Created by Kambiz Asadzadeh on 2017/11/10.
//  Copyright © 2017 Kambiz Asadzadeh. All rights reserved.
//


#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "intergrate.h"

using namespace Service;

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  qmlRegisterType <Intergrate> ("api.dotwaves.com", 1,0, "Service");

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
