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
	asm	("	SSBX FRCT	");//��1��С����
	asm	("	LD #10H, 8, A	");//A=1000H
	asm	("	LD #4H, B	");//B=4H
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	ST #5678H, *AR1+	");//(1500H)=5678H
	asm	("	ST #1234H, *AR1+	");//(1501H)=1234H
	asm	("	STM #1500H, AR3	");//AR3=1500H
	asm	("	STM #1501H, AR4	");//AR4=1501H
	asm	("	MAS *AR3, *AR4, A, B	");//A-(AR3)*(AR4)-->B
	asm	("	DST B, *AR1+	");//(1502H)(1503H)=B
	asm	("	MASR *AR3, *AR4, A, B	");//A-(AR3)*(AR4)-->B
	asm	("	DST B, *AR1+	");//(1504H)(1505H)=B
//---2 ���ó˼ӱ��y=0.1*0.8+(-0.2)*0.6+(-0.3)*(-0.9)
	asm	("	ST #0CCDH, *AR1+	");//(1506H)=0.1
	asm	("	ST #0E666H, *AR1+	");//(1507H)=-0.2
	asm	("	ST #0D99AH, *AR1+	");//(1508H)=-0.3
	asm	("	ST #6666H, *AR1+	");//(1509H)=0.8
	asm	("	ST #4CCDH, *AR1+	");//(150AH)=0.6
	asm	("	ST #8CCDH, *AR1+	");//(150BH)=-0.9
	asm	("	STM #1506H, AR3	");//AR3=1506H
	asm	("	STM #1509H, AR4	");//AR4=1509H
	asm	("	RPTZ A, #2	");//A=0,��һָ���ظ�ִ��2+1��
	asm	("	MAC *AR3+, *AR4+, A	");//(AR3)*(AR4)+A-->A
	asm	("	DST A, *AR1+	");//(150CH)(150DH)=A
//---3 ���ó˼����y=-0.1*(-0.8)-0.2*0.6-0.3*(-0.9)
	asm	("	ST #0CCDH, *AR1+	");//(150EH)=0.1
	asm	("	ST #199AH, *AR1+	");//(150FH)=0.2
	asm	("	ST #2666H, *AR1+	");//(1510H)=0.3
	asm	("	ST #999AH, *AR1+	");//(1511H)=-0.8
	asm	("	ST #4CCDH, *AR1+	");//(1512H)=0.6
	asm	("	ST #8CCDH, *AR1+	");//(1513H)=-0.9
	asm	("	STM #150EH, AR3	");//AR3=150EH
	asm	("	STM #1511H, AR4	");//AR4=1511H
	asm	("	RPTZ A, #2	");//A=0,��һָ���ظ�ִ��2+1��
	asm	("	MAS *AR3+, *AR4+, A	");//A-(AR3)*(AR4)-->A
	asm	("	DST A, *AR1+	");//(1514H)(1515H)=A
/**/
}




