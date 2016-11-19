#-------------------------------------------------
#
# Project created by QtCreator 2016-11-17T12:21:59
#
#-------------------------------------------------

QT += qml quick
CONFIG += c++11

TARGET = EventAppShared
TEMPLATE = lib

DEFINES += EVENTAPPSHARED_LIBRARY

SOURCES += eventappshared.cpp \
    eainfo.cpp \
    eacontainer.cpp \
    eaconstruction.cpp

HEADERS += eventappshared.h\
        eventappshared_global.h \
    eainfo.h \
    eacontainer.h \
    eaconstruction.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

DISTFILES += \
    EventAppShared.pro.user