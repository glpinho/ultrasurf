#include "accountParticles.hpp"

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
