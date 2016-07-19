#include "cpu_reg.h"
#include "common.h"

void zhiling();

void main()					//������
{
	init_dsp(); 			//dsp��ʼ��

	zhiling();				//ѧϰָ��

	while(1)				//��ѭ��
	{
		LED_flash();       	//����˸
	}
}  

void zhiling()
{
//---1
	asm	("	LD #12H, 8, A	");//A=1200H
	asm	("	LD #18H, 8, B	");//B=1800H
	asm	("	SUB #12345, 8, A, B	");//B=A-303900H
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	DST A, *AR1+	");//(1500H)(1501H)=A
	asm	("	DST B, *AR1+	");//(1502H)(1503H)=B
//---2
	asm	("	ST #41H, *AR1+	");//(1504H)=41H=65
	asm	("	ST #7H, *AR1+	");//(1505H)=7H=7
	asm	("	STM #1504H,AR2	");//AR2=1504H
	asm	("	LD *AR2+, B	");//B=41H
	asm	("	RPT #15	");//SUBC�ظ�ִ��15+1��
	asm	("	SUBC *AR2, B	");//ʹ��SUBCָ����ɳ���
	asm	("	STL B, *AR1+	");//����
	asm	("	STH B, *AR1+	");//������
//---3
	asm	("	ST #3852H, *AR1+	");//(1508H)=3852H=0.44
	asm	("	ST #1C29H, *AR1+	");//(1509H)=1C29H=0.22
	asm	("	STM #1508H,AR2	");//AR2=1508H
	asm	("	LD *AR2+, B	");//B=3852H
	asm	("	RPT #15	");//SUBC�ظ�ִ��15+1��
	asm	("	SUBC *AR2, B	");//ʹ��SUBCָ����ɳ���
	asm	("	STL B, *AR1+	");//����
	asm	("	STH B, *AR1+	");//������
//---4
	asm	("	ST #2CH, *AR1+	");//(150CH)=2CH=44
	asm	("	ST #0B0H, *AR1+	");//(150DH)=0B0H=176
	asm	("	STM #150CH,AR2	");//AR2=150CH
	asm	("	LD *AR2+,15, B	");//B=2CH<<15
	asm	("	RPT #15	");//SUBC�ظ�ִ��15+1��
	asm	("	SUBC *AR2, B	");//ʹ��SUBCָ����ɳ���
	asm	("	STL B, *AR1+	");//����
	asm	("	STH B, *AR1+	");//������
/**/
}




