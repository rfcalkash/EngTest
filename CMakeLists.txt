cmake_minimum_required(VERSION 3.16)

project(EngTest VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appEngTest
    main.cpp
)

qt_add_qml_module(appEngTest
    URI EngTest
    VERSION 1.0
    RESOURCES res.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appEngTest PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appEngTest
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appEngTest
    PRIVATE Qt6::Quick
)

if (ANDROID)
    set_target_properties(appEngTest PROPERTIES
        QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android"
        QT_ANDROID_PACKAGE_NAME "com.rfcexpert.SimpleTest"
        QT_ANDROID_APP_NAME "Simple Tests"
        QT_ANDROID_VERSION_NAME "0.2.5"
        QT_ANDROID_VERSION_CODE 1
        QT_ANDROID_APP_ICON "@drawable/simple_tests_icon"
    )
endif()

include(GNUInstallDirs)
install(TARGETS appEngTest
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
