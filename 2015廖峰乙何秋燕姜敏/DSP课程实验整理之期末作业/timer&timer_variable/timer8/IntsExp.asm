					.title			"Ints.asm"
					.mmregs

					.def			_c_int00

					.def            TCR1
					.def            PRD1
TCR1				.set            0032h
PRD1				.set            0031h
STACK				.usect			"STACK",80h
					.bss			y,1
					
					.text

;******************************************************************************
;							��    ʼ
;******************************************************************************

_c_int00:		STM  #STACK+10h,SP
                ;STM  #0000h,CLKMD
				;RPT  #100h
				;NOP
				;STM  #0FC00h,CLKMD
				SSBX XF
                ST   #1,y
				STM   y,AR1
				LD   #0h,DP
				STM  #02E0h,PMST
				SSBX INTM	;�ر������ж�
				STM  #0010h,TCR
				STM  #0FFFFh,PRD
				STM  #0C2Fh,TCR
				STM  #0008h,IFR
				STM  #0008h,IMR						
				RSBX INTM	;�������ж�
					
LOOP:			NOP
				B				LOOP
				RESET	;�����λCPU
					

;******************************************************************************
;							��    ��
;******************************************************************************

				.end
