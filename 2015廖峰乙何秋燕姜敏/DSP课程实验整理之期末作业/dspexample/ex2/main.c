#include "cpu_reg.h"
#include "common.h"

int sd[20];
int i;

void main()					//������
{
	init_dsp(); 			//dsp��ʼ��

	for(i = 0; i < 20; i ++)
	{
		sd[i] = i;
	}

	while(1)				//��ѭ��
	{
		LED_flash();       	//����˸
	}
}  

