TARGET = voicecall-manager
TEMPLATE = app
QT = core dbus
CONFIG += link_pkgconfig

DEFINES += WANT_TRACE

INCLUDEPATH += ../lib/src

# PKGCONFIG += libresourceqt5

packagesExist(qt5-boostable) {
    DEFINES += HAS_BOOSTER
    PKGCONFIG += qt5-boostable
} else {
    warning("qt5-boostable not available; startup times will be slower")
}

QT += multimedia # for basic ringtone plugin.
LIBS += -L../lib/src -lvoicecall

HEADERS += \
    dbus/voicecallmanagerdbusservice.h \
    basicvoicecallconfigurator.h \
    voicecallmanager.h \
    basicringtonenotificationprovider.h

SOURCES += \
    dbus/voicecallmanagerdbusservice.cpp \
    basicvoicecallconfigurator.cpp \
    voicecallmanager.cpp \
    main.cpp \
    basicringtonenotificationprovider.cpp

target.path = /usr/bin

INSTALLS += target

OTHER_FILES += voicecall-manager.desktop voicecall-manager.service

systemd_service_entry.files = voicecall-manager.service
systemd_service_entry.path = /usr/lib/systemd/user

# INSTALLS += autostart_entry systemd_service_entry

