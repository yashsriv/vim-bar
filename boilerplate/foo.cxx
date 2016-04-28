#include <opencv2/opencv.hpp>
using namespace cv;
int main(int argc, char **argv) {
  VideoCapture cam(0);
  Mat img;
  while(true) {
    cam >> img;
    imshow("Image",img);
    waitKey(5);
  }
  return 0;
}
