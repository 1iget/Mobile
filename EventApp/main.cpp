#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtWebView>
#include <QSettings>
#include <QQuickStyle>
#include <QApplication>

//#include "../QtAdMob/QtAdMobBanner.h"
//#include "../QtAdMob/QtAdMobInterstitial.h"

#include "eainfo.h"
#include "eacontainer.h"
#include "eaconstruction.h"
#include "eaitemlist.h"
#include "eauser.h"
#include "eaitem.h"
#include "httpdownload.h"
#include "eaobjdisplay.h"
#include "eamap.h"
#include "eastrings.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("EasyEventApps");
    QGuiApplication app(argc, argv);
    app.setOrganizationName("EasyEventApps");
    app.setOrganizationDomain("www.easyeventapps.com");
    app.setApplicationName("EventApp");
    app.setApplicationVersion(GIT_VERSION);
    QtWebView::initialize();

    QSettings::setDefaultFormat(QSettings::IniFormat);
    QSettings settings;
    QString style = QQuickStyle::name();
    if (!style.isEmpty())
        settings.setValue("style", style);
    else
        QQuickStyle::setStyle(settings.value("style").toString());

    //QmlAdMobBanner::DeclareQML();           // <== Call it before loading qml
    //QmlAdMobInterstitial::DeclareQML();     // <== Call it before loading qml

    //QString version = GIT_VERSION;


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
    qmlRegisterType<EAStrings>("EventAppData", 1,0, "EAStrings");
    
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("applicationPath", "file://"+qApp->applicationDirPath()+ "/");

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
