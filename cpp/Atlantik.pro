QT       += core gui
QT       += sql

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle

SOURCES += main.cpp \
    bateau.cpp \
    bateauvoyageur.cpp \
    equipement.cpp \
    passerelle.cpp \
    pdf.cpp

include(deployment.pri)
qtcAddDeployment()

HEADERS += \
    bateau.h \
    bateauvoyageur.h \
    equipement.h \
    passerelle.h \
    pdf.h

