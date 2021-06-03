#pragma once
#include "opencv2/core.hpp"
#include "opencv2/imgcodecs.hpp"
#include "opencv2/imgproc.hpp"
#include <vector>
#include <array>
#include <string>
#ifdef __linux__
	#include <dirent.h>
#elif _WIN64
	#include <Windows.h>
#endif
#include <iostream>
#include "Particle.hpp"
#include "globVector.hpp"
#include "getParticles.hpp"

int main(int argc, char **argv);