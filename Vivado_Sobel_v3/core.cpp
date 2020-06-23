#include <hls_video.h>
#include <stdint.h>
#include <stdio.h>

void Sobel(unsigned char image_in[10*10], unsigned char image_out[10*10]){

//#pragma HLS INTERFACE ap_memory port=image_out
//#pragma HLS INTERFACE ap_memory port=image_in
//#pragma HLS INTERFACE ap_memory port=ap_return
#pragma HLS DATAFLOW
//#pragma HLS array_partition variable=image_in c factor=2
//#pragma HLS array_reshape variable=frame complete factor=4 dim=1
//#pragma HLS array_reshape variable=frame block factor=4 dim=1
#pragma HLS array_reshape variable=image_in cyclic factor=4 dim=1
#pragma HLS array_reshape variable=image_out cyclic factor=4 dim=1
//#pragma HLS latency min=10 max=2000
#pragma HLS RESOURCE variable=image_in core=RAM_1P_BRAM
#pragma HLS RESOURCE variable=image_out core=RAM_1P_BRAM


	//hls::Window<3,3,char> kernel;
	const char coefficients[3][3] = { { -1,-2,-1 },
									  { 0, 0, 0 },
									  { 1, 2, 1 } };
	/*kernel.insert_row({-1,-2,-1}, 0);
	kernel.insert_row({0,0,0}, 0);
	kernel.insert_row({1,2,1}, 0);*/

	hls::Mat<10,10,HLS_8UC1> src;
	hls::Mat<10,10,HLS_8UC1> dst;
	//#pragma hls stream variable=src
	//#pragma hls stream variable=dst
	hls::AXIM2Mat<10,unsigned char,10,10,HLS_8UC1>(image_in,src);



	hls::Window<3,3,char> kernel;

	//kernel.insert(coefficients,3,3);

	//#pragma HLS array_reshape variable=kernel cyclic factor=2 dim=1

	/*for (int i=0;i<3;i++){
		for (int j=0;j<3;j++){
			kernel.val[i][j]=coefficients[i][j];
		}
	}*/

	for (int i=0;i<3;i++){
			for (int j=0;j<3;j++){
				kernel.insert(coefficients[i][j],i,j);
			}
		}


	hls::Point_<int> anchor = hls::Point_<int>(-1,-1);

	hls::Filter2D(src,dst,kernel,anchor);
	hls::Mat2AXIM<10,unsigned char,10,10,HLS_8UC1>(dst,image_out);
}

