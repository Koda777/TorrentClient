cmake_minimum_required(VERSION 3.10)
project(wxwidgets_example)

# Recherche de wxWidgets
find_package(wxWidgets REQUIRED COMPONENTS core base)
include(${wxWidgets_USE_FILE})
include_directories(${wxWidgets_INCLUDE_DIRS})


# Ajout des fichiers sources
file(GLOB SRC_FILES "core/*.cpp")

# Création de l'exécutable
add_executable(${PROJECT_NAME} ${SRC_FILES})
add_definitions("-DwxUSE_UNICODE")

# Liens avec wxWidgets
target_link_libraries(${PROJECT_NAME} ${wxWidgets_LIBRARIES})

