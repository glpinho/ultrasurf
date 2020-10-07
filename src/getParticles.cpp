#include "getParticles.hpp"

std::vector<Particle> getParticles(cv::Mat img)
{
    using namespace std;
    using namespace cv;
    vector<Particle> particles;

    vector<vector<Point>> contours;
    findContours(img, contours, RETR_LIST, CHAIN_APPROX_NONE);
    for (int i = 0; i < contours.size(); i++)
    {
        Particle particle;
        vector<Point> contour = contours[i];
        particle.perimeter = arcLength(contour, true);
        Rect bounding = boundingRect(contour);
        particle.image = img(bounding);
        particle.area = contourArea(contour);
        particle.calculateCentroid(bounding.x, bounding.y);
        particles.push_back(particle);
    }

    return particles;
}