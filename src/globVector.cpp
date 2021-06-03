#include "globVector.hpp"

std::vector<std::string> globVector(const std::string &pattern)
{
    std::vector<std::string> files;

    #ifdef __linux__

        DIR *dpdf;
        struct dirent *epdf;
        dpdf = opendir(pattern.c_str());
        if (dpdf != NULL) {
            while (epdf = readdir(dpdf)){
                if (epdf->d_name[0] == '.') continue;
                std::string dir = std::string(pattern);
                std::string bar = "/";
                std::string file = std::string(epdf->d_name);
                std::string completePath = dir.append(bar).append(file);
                files.push_back(completePath);
            }
        }
        closedir(dpdf);

    #elif _WIN64

        // windows code

    #endif  

    return files;
}