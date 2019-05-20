QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    Source/Model/calculationresultmodel.cpp \
        Source/calculatemanager.cpp \
        Source/calculator.cpp \
    Source/filemanager.cpp \
        Source/main.cpp \

RESOURCES += Source/qml.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Source/Commands/calculationcommand.h \
    Source/Commands/logcommand.h \
    Source/Commands/quadraticcommand.h \
    Source/Commands/sincommand.h \
    Source/Commands/sincoscommand.h \
    Source/Model/calculationresultmodel.h \
    Source/calculatemanager.h \
    Source/calculator.h \ \
    Source/filemanager.h


DISTFILES += \
    Source/ChartPage.qml \
    Source/ComboBoxFxModel.qml \
    Source/ResultPage.qml \
    Source/ResultPageDelegate.qml \
    Source/ResultPageHeader.qml \
    Source/WorkPage.qml \
    Source/main.qml
