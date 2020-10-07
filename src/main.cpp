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

struct cutParticleOutput;
std::vector<std::string> globVector(const std::string &pattern);
std::vector<Particle> getParticles(cv::Mat img);
cutParticleOutput cutParticle(cv::Mat img, int lastRow);

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

    // // int thresh1 = (int)argv[1];
    // // int thresh2 = (int)argv[2];
    // // cv::Mat img = cv::imread("img.png", 0);
    // // cv::resize(img, img, cv::Size(436 * 2, 250 * 2), 0, 0);
    // // cv::Mat edges;
    // // cv::Canny(img, edges, thresh1, thresh2);
    // // cv::imwrite("out.png", edges);
    // Mat A = imread("sim.png", IMREAD_GRAYSCALE);

    // int counter = 0, counter2 = 0;

    // double t = (double)getTickCount();
    // uchar *p;
    // for (int i = 0; i < A.rows; i++)
    // {
    //     p = A.ptr<uchar>(i);
    //     for (int j = 0; j < A.cols; j++)
    //     {
    //         cout << (int)p[j] << "\n";
    //     }
    // }
    // t = (double)getTickCount() - t;

    // cout << "\n";

    // double t2 = (double)getTickCount();
    // MatIterator_<uchar> it, end;
    // for (it = A.begin<uchar>(), end = A.end<uchar>(); it != end; it++)
    // {
    //     cout << (int)*it << "\n";
    // }
    // t2 = (double)getTickCount() - t2;
    // cout << "\n";
    // cout << t << "\n";
    // cout << t2 << "\n";
}

std::vector<std::string> globVector(const std::string &pattern)
{
    glob_t glob_result;
    glob(pattern.c_str(), GLOB_TILDE, NULL, &glob_result);
    std::vector<std::string> files;
    for (unsigned int i = 0; i < glob_result.gl_pathc; ++i)
    {
        files.push_back(std::string(glob_result.gl_pathv[i]));
    }
    globfree(&glob_result);
    return files;
}

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

struct cutParticleOutput
{
    cv::Mat particle;
    cv::Mat newImg;
    int lastRow;
};

cutParticleOutput cutParticle(cv::Mat img, int lastRow)
{
    using namespace cv;
    using namespace std;

    cutParticleOutput varOut;
    imwrite("teste0.png", img);
    img = img == 255;
    imwrite("teste1.png", img);

    uchar *p;
    bool broken = false;
    for (int i = lastRow; i < img.rows; i++)
    {
        p = img.ptr<uchar>(i);
        for (int j = 0; j < img.cols; j++)
        {
            if ((int)p[j])
            {
                Mat inverted;
                bitwise_not(img, inverted);
                Mat inverted_filled = inverted.clone();
                floodFill(inverted_filled, Point2d(j, i), Scalar(255));
                Mat imout = Mat::zeros(img.size(), CV_8U);
                Mat particle;
                absdiff(inverted_filled, inverted, particle);
                varOut.particle = particle;
                bitwise_not(inverted_filled, varOut.newImg);

                broken = true;
                break;
            };
        }
        if (broken)
            break;
    }

    return varOut;
}
