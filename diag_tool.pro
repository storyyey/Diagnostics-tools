QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS \
            __HAVE_CAN_ZLG__

if(contains(DEFINES,__HAVE_PCAP__)){
    DEFINES += WPCAP HAVE_REMOTE
}

if(contains(DEFINES,__HAVE_CHARTS__)){
    QT += charts
}

if(contains(DEFINES,__HAVE_XLSX__)){
    QT += xlsx
}

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    QtAES/qaesencryption.cpp \
    can.cpp \
    diagpcap.cpp \
    doipclient.cpp \
    fileselect.cpp \
    login.cpp \
    main.cpp \
    mainwindow.cpp \
    messageview.cpp \
    softupdate.cpp \
    stream.c \
    tabletoxlsx.cpp \
    toolcharhextransform.cpp \
    toolrealtimelog.cpp \
    uds.cpp \
    udsdb.cpp \
    udsprotocolanalysis.cpp \
    upgrade.cpp \
    useauthcode.cpp

HEADERS += \
    Include/Packet32.h \
    Include/Win32-Extensions.h \
    Include/bittypes.h \
    Include/ip6_misc.h \
    Include/pcap-bpf.h \
    Include/pcap-namedb.h \
    Include/pcap-stdinc.h \
    Include/pcap.h \
    Include/pcap/bluetooth.h \
    Include/pcap/bpf.h \
    Include/pcap/namedb.h \
    Include/pcap/pcap.h \
    Include/pcap/sll.h \
    Include/pcap/usb.h \
    Include/pcap/vlan.h \
    Include/remote-ext.h \
    QtAES/aesni/aesni-enc-cbc.h \
    QtAES/aesni/aesni-enc-ecb.h \
    QtAES/aesni/aesni-key-exp.h \
    QtAES/aesni/aesni-key-init.h \
    QtAES/qaesencryption.h \
    can.h \
    canframe.h \
    config.h \
    diagpcap.h \
    doipclient.h \
    fileselect.h \
    login.h \
    mainwindow.h \
    messageview.h \
    softupdate.h \
    stream.h \
    tabletoxlsx.h \
    toolcharhextransform.h \
    toolrealtimelog.h \
    typedef.h \
    uds.h \
    udsdb.h \
    udsprotocolanalysis.h \
    upgrade.h \
    useauthcode.h \
    zlgcan.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    icon.qrc

DISTFILES += \
    icon/delete.png \
    icon/testProcess.gif \
    icon/transfer.png

if(contains(DEFINES,__HAVE_CAN_ZLG__)){
    LIBS += -L./ -lzlgcan
}

if(contains(DEFINES,__HAVE_PCAP__)){
    LIBS += -L./ -lwpcap -lws2_32 -liphlpapi
    INCLUDEPATH += ./Include ./Include/pcap
}
#程序版本
VERSION = 3.1.8
#程序图标
RC_ICONS = car.ico
#产品名称
QMAKE_TARGET_PRODUCT = DiagnosticsTool
#版权所有
QMAKE_TARGET_COPYRIGHT = storyyey@github

QMAKE_TARGET_DESCRIPTION = DiagnosticsTool

TARGET = DiagnosticsTool.$${VERSION}

FORMS += \
    fileselect.ui \
    login.ui \
    toolcharhextransform.ui \
    toolrealtimelog.ui \
    udsprotocolanalysis.ui \
    upgrade.ui \
    useauthcode.ui
