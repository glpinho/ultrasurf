#pragma once
#include <array>
#include "opencv2/core.hpp"

class Particle
{
private:
    std::array<float, 2> centroid; // [x, y]

public:
    cv::Mat image;
    float perimeter;
    int area;

    void calculateCentroid(int x, int y);
};