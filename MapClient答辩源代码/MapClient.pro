!include(deployment.pri ) {
    error( "Couldn't find the deployment.pri file!" )
}

QT += core gui widgets

QT += 3dcore 3drender 3dinput 3dquick qml quick 3dquickextras quickwidgets

HEADERS += \
    mainwindow.h \
    logview.h \
    propertyview.h \
    entitybinding.h

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    logview.cpp \
    propertyview.cpp \
    entitybinding.cpp

RESOURCES += \
    metalbarrel.qrc \
    textures.qrc \
    materials.qrc \
    chest.qrc \
    houseplants.qrc \
    trefoilknot.qrc

FORMS += \
    mainwindow.ui
