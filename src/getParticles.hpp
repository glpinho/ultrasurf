#pragma once
#include <vector>
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "Particle.hpp"

std::vector<Particle> getParticles(cv::Mat img);