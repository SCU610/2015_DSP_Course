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
//---1 �����˷�
	asm	("	STM #1500H, AR1	");//AR1=1500H
	asm	("	ST #2000H, *AR1	");//(AR1)=(1500H)=2000H
	asm	("	RSBX FRCT	");//��FTCT��־λ׼��������
	asm	("	LD *AR1+, T	");//T=(AR1)
	asm	("	MPY #-2, A	");//A=-2*T
	asm	("	STL A, *AR1+	");//(1501H)=A(15~0)
	asm	("	DST A, *AR1+	");//(1502H)(1503H)=A
//---2 С���˷�
	asm	("	SSBX SXM	");//SXM=1
	asm	("	ST #0E000H, *AR1+	");//(1504H)=E000H=-0.25
	asm	("	ST #1000H, *AR1+	");//(1505H)=1000H=0.125
	asm	("	SSBX FRCT	");//��FTCT��־λ׼��С����
	asm	("	STM #1504H, AR2	");//AR2=1504H
	asm	("	LD *AR2+, 16, A	");//A(31~16)=(AR2)
	asm	("	MPYA *AR2	");//A(31~16)*(AR2)-->B(31~16)
	asm	("	STH A, *AR1+	");//(1506H)=A=-0.25
	asm	("	STH B, *AR1+	");//(1507H)=B=-0.03125
//---3 ��ΪС���ĳ���
	asm	("	ST #2CH, *AR1+	");//(1508H)=2CH=44
	asm	("	ST #0FF50H, *AR1+	");//(1509H)=-176
	asm	("	RSBX FRCT	");//��FTCT��־λ׼��������
	asm	("	STM #1509H, AR2	");//AR2=1509H
	//���س���-176���뱻�������˷�
	asm	("	LD *AR2-, 16, A	");//A(31~16)=(AR2)=-176
	asm	("	MPYA *AR2+	");//A(31~16)*(AR2)-->B(15~0)
	//������ľ���ֵ
	asm	("	ABS A	");//������ȡ����ֵA(31~16)=176
	asm	("	STH A, *AR2-	");//������ֵ�Ż�ԭλ
	//���ر�����44��ȡ����ֵ��������
	asm	("	LD *AR2+, 16, A	");//A(31~16)=44
	asm	("	ABS A	");//ȡ����ֵA(31~16)=44
	asm	("	RPT #14	");//��һ��ָ���ظ�ִ��(14+1)��
	asm	("	SUBC *AR2, A	");//��������
	asm	("	XC 1, BLT	");//���B<0��ִ��NEGָ��
	asm	("	NEG A	");//��Ϊ��
	asm	("	STL A, *AR1+	");//����(1510H)=A
/**/
}




