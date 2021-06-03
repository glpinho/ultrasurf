#pragma once
#include <vector>
#include <string>
#ifdef __linux__
    #include <dirent.h>
#elif _WIN64
    #include <windows.h
#endif

std::vector<std::string> globVector(const std::string &pattern);