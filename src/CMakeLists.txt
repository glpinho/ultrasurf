cmake_minimum_required(VERSION 2.8)
project( ultrasurf )

set(EXECUTABLE_NAME "accountParticles")

add_executable( ${EXECUTABLE_NAME} accountParticles.cpp )
target_include_directories(${EXECUTABLE_NAME}
    PUBLIC lib/opencv_install/include
)
target_link_libraries(${EXECUTABLE_NAME}
    ${PROJECT_SOURCE_DIR}/lib/opencv_install/opencv_world451.lib
)


add_library( UltraSurf Particle.cpp globVector.cpp getParticles.cpp)
target_include_directories(UltraSurf
    PUBLIC lib/opencv_install/include
    PUBLIC lib/opencv_install/include/opencv4/
)
target_link_libraries(UltraSurf
    ${PROJECT_SOURCE_DIR}/lib/opencv_install/opencv_world451.lib
)


target_link_libraries( ${EXECUTABLE_NAME} UltraSurf )
