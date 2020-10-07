#include "opencv2/imgproc.hpp"
#include "opencv2/imgcodecs.hpp"
// #include "opencv2/highgui.hpp"
// #include "opencv2/opencv.hpp"
#include "opencv2/core.hpp"
// #include "opencv2/features2d.hpp"
// #include "opencv2/stitching.hpp"
#include <vector>
#include <array>
#include <string>
#include <glob.h>
#include <iostream>
#include "Particle.hpp"
#include "globVector.hpp"
#include "getParticles.hpp"

void LOG(std::string message)
{
    std::cout << message << "\n";
}

int main(int argc, char **argv)
{
    using namespace cv;
    using namespace std;

    if (!globVector("FramesBin/*").empty())
        system("rm FramesBin/*");

    vector<string> imlist = globVector("BWImages/*");

    for (int i = 0; i < imlist.size(); i++)
    {
        cout << "Frame: " << i << " - ";
        Mat img = imread(imlist[i], IMREAD_GRAYSCALE);
        vector<Particle> particles = getParticles(img);
        cout << "Num of particles: " << particles.size() << "\n";
    }

    return 0;
}
