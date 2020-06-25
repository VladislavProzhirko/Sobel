#include <hls_opencv.h>
#include <stdint.h>
#include <stdio.h>

using namespace cv;
#pragma HLS INTERFACE m_axi depth=2073600 port=image_out offset=slave bundle=CRTL_BUS
#pragma HLS INTERFACE m_axi depth=2073600 port=image_in offset=slave bundle=CRTL_BUS
void Sobel(uint8_t * image_in, uint8_t * image_out);

int main(){

		Mat im = imread("go_800.jpg",CV_LOAD_IMAGE_GRAYSCALE);
		uint8_t image_in[800*800];
		uint8_t image_out[800*800];

		memcpy(image_in,im.data,sizeof(uint8_t)*800*800);

		Sobel(image_in, image_out);

		Mat out = Mat(800,800,CV_8UC1,image_out);

		IplImage image = IplImage(out);
		cvSaveImage("filename.jpg", &image);//save file in \...\Vivado_Sobel_v3\solution1\csim\build

		/*namedWindow("test");
		imshow("test",out);
		waitKey(0);*/
		return 0;
}
