#include "accountParticles.hpp"
#include <fstream>

int main(int argc, char **argv)
{

    using namespace cv;
    using namespace std;

    if (!globVector("FramesBin").empty())
        system("rm FramesBin");

    vector<string> imlist = globVector("BWImages");

    for (int i = 0; i < imlist.size(); i++)
    {
        fstream file;
        string filename = "Data/frame" + to_string(i) + ".csv";
        file.open(filename, ios::out);
        file << "ID, X, Y, Perimeter, Area" << endl;

        Mat img = imread(imlist[i], IMREAD_GRAYSCALE);

        vector<Particle> particles = getParticles(img);
        for (int j = 1; j < particles.size(); j++)
        {
            Particle particle = particles[j];
            file << j << ", ";
            file << particle.getX() << ", ";
            file << particle.getY() << ", ";
            file << particle.perimeter << ", ";
            file << particle.area << endl;
        }
        file.close();
    }

    return 0;
}
