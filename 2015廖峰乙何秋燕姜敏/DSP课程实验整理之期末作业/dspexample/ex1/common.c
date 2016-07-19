#include "cpu_reg.h"

void init_dsp()		//��ʼ��dsp
{
	asm	("	STM		#0000h,	CLKMD  	");  	//����PLLʱ��ģʽ���ر�PLL
	while(*CLKMD & 0x01 );					//�ȴ�ֱ���ر�PLL
	asm	("  STM 	#5007h, CLKMD  	"); 	//����ʱ��ģʽPLLx6��16.9344x6=101.6��������CPU����Ƶ�ʣ�101M
	asm	("  STM 	#4240h, SWWSR  	");		//��������ȴ�״̬�Ĵ�����XPA=0��I/O=100��Data=001001��Program=0
	asm	("  STM 	#00a0h, PMST  	");  	//���ý���ģʽ״̬�Ĵ�����IPTR=001h��MP/MC=0��ovly=1  
	asm	("  STM 	#0802h, BSCR  	"); 	//����Bank-Switching���ƼĴ�����BNKCMP=0��PS-DS=1��HBH=0��BH=1��EXIO=0
}

void delay(int k)
{
	int i;
	long j;
	for(i=0;i<k;i++)
		for(j=0;j<7400;j++);
}

void LED_flash()
{
	asm("  RSBX  XF "); //��200ms
	delay(300);
	asm("  SSBX  XF "); //��800ms
	delay(300);
}





