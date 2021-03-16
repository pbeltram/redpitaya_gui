
TARGET = qt-oscilloscope
TEMPLATE = app

CONFIG += qt qwt warn_on thread release

CONFIG(debug, debug|release) {
    DESTDIR = ./
    OBJECTS_DIR = ./Debug/obj
    MOC_DIR = ./Debug/moc
    RCC_DIR = ./Debug/rcc
    UI_DIR = ./Debug/ui
} else {
    DESTDIR = ./
    OBJECTS_DIR = ./Release/obj
    MOC_DIR = ./Release/moc
    RCC_DIR = ./Release/rcc
    UI_DIR = ./Release/ui
}

HEADERS = \
    src/signaldata.h \
    src/plot.h \
    src/knob.h \
    src/wheelbox.h \
    src/samplingthread.h \
    src/curvedata.h \
    src/mainwindow.h 

SOURCES = \
    src/signaldata.cpp \
    src/plot.cpp \
    src/knob.cpp \
    src/wheelbox.cpp \
    src/samplingthread.cpp \
    src/curvedata.cpp \
    src/mainwindow.cpp \
    src/main.cpp

DEPENDPATH += ./src

INCLUDEPATH += \
    ./src


extraclean.commands = find . -type f -name \"*.lst\" -exec rm -v {} \\;
clean.depends = extraclean
QMAKE_EXTRA_TARGETS += clean extraclean

