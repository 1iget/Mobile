#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
//#include <qtwebengineglobal.h>
//#include <QtWebEngine>
#include <QtWebView>
#include <QSettings>
#include <QQuickStyle>
#include "../QtAdMob/QtAdMobBanner.h"
#include "../QtAdMob/QtAdMobInterstitial.h"
#include "eainfo.h"
#include "eacontainer.h"
#include "eaconstruction.h"
#include "eaitemlist.h"
#include "eauser.h"
#include "eaquestion.h"
#include "eaitem.h"
#include "httpdownload.h"
#include "eaobjdisplay.h"
#include "eamap.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QtWebView::initialize();
    //QtWebEngine::initialize();

    QSettings::setDefaultFormat(QSettings::IniFormat);
    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty())
        settings.setValue("style", style);
    else
        QQuickStyle::setStyle(settings.value("style").toString());

    QmlAdMobBanner::DeclareQML();           // <== Call it before loading qml
    QmlAdMobInterstitial::DeclareQML();     // <== Call it before loading qml

    QFontDatabase fontDatabase;
    if (fontDatabase.addApplicationFont(":/fonts/fontello.ttf") == -1)
        qWarning() << "Failed to load fontello.ttf";

    app.setOrganizationName("Pierses");
    app.setOrganizationDomain("eventapps.com");
    app.setApplicationName("PiersesEventAppDesigner");

    qmlRegisterType<EAContainer>("EventAppData", 1,0, "EAContainer");
    qmlRegisterType<EAConstruction>("EventAppData", 1,0, "EAConstruction");
    qmlRegisterType<EAInfo>("EventAppData", 1,0, "EAInfo");
    qmlRegisterType<EAItemList>("EventAppData", 1,0, "EAItemList");
    qmlRegisterType<HttpDownload>("EventAppData", 1,0, "HttpDownload");
    qmlRegisterType<EAUser>("EventAppData", 1,0, "EAUser");
    qmlRegisterType<EAItem>("EventAppData", 1,0, "EAItem");
    qmlRegisterType<EaQuestion>("EventAppData", 1,0, "EaQuestion");
    qmlRegisterType<EAObjDisplay>("EventAppData", 1,0, "EAObjDisplay");
    qmlRegisterType<EAMap>("EventAppData", 1,0, "EAMap");

   // qmlRegisterType<EAItem>("EventAppData", 1, 0, "ItemType");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("applicationPath", "file://"+qApp->applicationDirPath()+ "/");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
