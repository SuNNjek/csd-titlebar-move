cmake_minimum_required(VERSION 3.27)

project(csd-titlebar-move
    DESCRIPTION "CSD titlebar move plugin for Hyprland"
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE SRC "*.cpp")

add_library(csd-titlebar-move SHARED ${SRC})

find_package(PkgConfig REQUIRED)
pkg_check_modules(deps REQUIRED IMPORTED_TARGET
    pixman-1
    libdrm
    hyprland
    pangocairo
    libinput
    libudev
    wayland-server
    xkbcommon
)
target_link_libraries(csd-titlebar-move PRIVATE rt PkgConfig::deps)

install(TARGETS csd-titlebar-move)