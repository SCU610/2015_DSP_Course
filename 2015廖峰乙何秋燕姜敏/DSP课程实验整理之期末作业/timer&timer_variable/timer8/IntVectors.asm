;�ļ���:			IntVectors.asm
;����:				TMSC54xϵ��DSP����CCS���ж�������̼����ļ����Դ����
;����:				Cui Ao
;��������:			2015��5��6��
;����޸�����:		2015��5��6��


;����Ŀ¼��			IntSer.asm---------------------�жϷ������ļ�
;					IntsExp.asm--------------------������ļ���оƬ��λ���(_c_int00)
;					IntVectors.asm-----------------�ж������ļ�
;					memory.cmd---------------------�ڴ���������ļ�

				.title			"IntVectors.asm"
				.mmregs
				.ref			_c_int00
				.ref			_c_int01_NMI
				.ref			_c_int02_SINT17
				.ref			_c_int03_SINT18
				.ref			_c_int04_SINT19
				.ref			_c_int05_SINT20
				.ref			_c_int06_SINT21
				.ref			_c_int07_SINT22
				.ref			_c_int08_SINT23
				.ref			_c_int09_SINT24
				.ref			_c_int10_SINT25
				.ref			_c_int11_SINT26
				.ref			_c_int12_SINT27
				.ref			_c_int13_SINT28
				.ref			_c_int14_SINT29
				.ref			_c_int15_SINT30
				.ref			_c_int16_INT0
				.ref			_c_int17_INT1
				.ref			_c_int18_INT2
				.ref			_c_int19_TINT0
				.ref			_c_int20_BRINT0
				.ref			_c_int21_BXINT0
				.ref			_c_int22_SINT6
				.ref			_c_int23_TINT1
				.ref			_c_int24_INT3

				.sect			.intvectors

;******************************************************************************
;							��    ʼ
;******************************************************************************

;����.ref�����ã���д0���жϵ�24���жϵ��ж�����
                B			_c_int00
				NOP
				NOP
				B			_c_int01_NMI
				NOP
				NOP
				B			_c_int02_SINT17
				NOP
				NOP
				B			_c_int03_SINT18
				NOP
				NOP
				B			_c_int04_SINT19
				NOP
				NOP
				B			_c_int05_SINT20
				NOP
				NOP
				B			_c_int06_SINT21
				NOP
				NOP
				B			_c_int07_SINT22
				NOP
				NOP
				B			_c_int08_SINT23
				NOP
				NOP
				B			_c_int09_SINT24
				NOP
				NOP
				B			_c_int10_SINT25
				NOP
				NOP
				B			_c_int11_SINT26
				NOP
				NOP
				B			_c_int12_SINT27
				NOP
				NOP
				B			_c_int13_SINT28
				NOP
				NOP
				B			_c_int14_SINT29
				NOP
				NOP
				B			_c_int15_SINT30
				NOP
				NOP
				B			_c_int16_INT0
				NOP
				NOP
				B			_c_int17_INT1
				NOP
				NOP
				B			_c_int18_INT2
				NOP
				NOP
				B			_c_int19_TINT0
				NOP
				NOP
				B			_c_int20_BRINT0
				NOP
				NOP
				B			_c_int21_BXINT0
				NOP
				NOP
				B			_c_int22_SINT6
				NOP
				NOP
				B			_c_int23_TINT1
				NOP
				NOP
				B			_c_int24_INT3
				NOP
				NOP

;******************************************************************************
;							��    ��
;******************************************************************************

				.end