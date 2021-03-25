#include "Particle.hpp"

void Particle::calculateCentroid(int x, int y)
{
    cv::Mat img = this->image;
    int sumr = 0, sumc = 0, counter = 0;
    for (int r = 0; r < img.rows; r++)
    {
        for (int c = 0; c < img.cols; c++)
        {
            if (img.at<uchar>(c, r))
            {
                sumr += r;
                sumc += c;
                counter++;
            }
        }
    }
    this->centroid = {(((float)sumc) / counter) + (float)x,
                      (((float)sumr) / counter) + (float)y};
}

int Particle::getX()
{
    return this->centroid[0];
}

int Particle::getY()
{
    return this->centroid[1];
}