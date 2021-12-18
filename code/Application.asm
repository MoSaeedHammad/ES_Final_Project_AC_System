
_main:

;Application.c,9 :: 		void main()
;Application.c,14 :: 		TRISB=0x00;
	CLRF        TRISB+0 
;Application.c,15 :: 		TRISC=0x00;
	CLRF        TRISC+0 
;Application.c,16 :: 		TRISD=0x00;
	CLRF        TRISD+0 
;Application.c,17 :: 		TRISE=0x00;
	CLRF        TRISE+0 
;Application.c,20 :: 		initLCD();
	CALL        _InitLCD+0, 0
;Application.c,21 :: 		i2c_init();
	CALL        _i2c_init+0, 0
;Application.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,26 :: 		Lcd_Out(1,1,"Test RTC");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Application+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Application+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Application.c,27 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,28 :: 		Rtc_GetDateTime(date, time);
	MOVLW       _date+0
	MOVWF       FARG_Rtc_GetDateTime_date+0 
	MOVLW       hi_addr(_date+0)
	MOVWF       FARG_Rtc_GetDateTime_date+1 
	MOVLW       _time+0
	MOVWF       FARG_Rtc_GetDateTime_time+0 
	MOVLW       hi_addr(_time+0)
	MOVWF       FARG_Rtc_GetDateTime_time+1 
	CALL        _Rtc_GetDateTime+0, 0
;Application.c,30 :: 		Lcd_Out_CP(date);
	MOVLW       _date+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_date+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,31 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Application.c,32 :: 		for(i=0;i<20;i++)
	CLRF        main_i_L0+0 
L_main1:
	MOVLW       20
	SUBWF       main_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main2
;Application.c,34 :: 		Rtc_GetDateTime(date, time);
	MOVLW       _date+0
	MOVWF       FARG_Rtc_GetDateTime_date+0 
	MOVLW       hi_addr(_date+0)
	MOVWF       FARG_Rtc_GetDateTime_date+1 
	MOVLW       _time+0
	MOVWF       FARG_Rtc_GetDateTime_time+0 
	MOVLW       hi_addr(_time+0)
	MOVWF       FARG_Rtc_GetDateTime_time+1 
	CALL        _Rtc_GetDateTime+0, 0
;Application.c,35 :: 		Lcd_Cmd(_LCD_SECOND_ROW);;
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,36 :: 		Lcd_Out_CP(time);
	MOVLW       _time+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_time+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,37 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;Application.c,32 :: 		for(i=0;i<20;i++)
	INCF        main_i_L0+0, 1 
;Application.c,38 :: 		}
	GOTO        L_main1
L_main2:
;Application.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,43 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,44 :: 		Lcd_Out_CP("Test EEPROM EXT");
	MOVLW       ?lstr2_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,47 :: 		tmp=EepromExt_Read(10);
	MOVLW       10
	MOVWF       FARG_EepromExt_Read_addr+0 
	MOVLW       0
	MOVWF       FARG_EepromExt_Read_addr+1 
	CALL        _EepromExt_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_tmp_L0+0 
;Application.c,48 :: 		lcd_Out_CP(tmp);
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,50 :: 		EepromExt_Write(10,0xA5);
	MOVLW       10
	MOVWF       FARG_EepromExt_Write_addr+0 
	MOVLW       0
	MOVWF       FARG_EepromExt_Write_addr+1 
	MOVLW       165
	MOVWF       FARG_EepromExt_Write_val+0 
	CALL        _EepromExt_Write+0, 0
;Application.c,51 :: 		EepromExt_Write(10,0x5A);
	MOVLW       10
	MOVWF       FARG_EepromExt_Write_addr+0 
	MOVLW       0
	MOVWF       FARG_EepromExt_Write_addr+1 
	MOVLW       90
	MOVWF       FARG_EepromExt_Write_val+0 
	CALL        _EepromExt_Write+0, 0
;Application.c,52 :: 		i= EepromExt_Read(10);
	MOVLW       10
	MOVWF       FARG_EepromExt_Read_addr+0 
	MOVLW       0
	MOVWF       FARG_EepromExt_Read_addr+1 
	CALL        _EepromExt_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_i_L0+0 
;Application.c,54 :: 		EepromExt_Write(10,tmp);
	MOVLW       10
	MOVWF       FARG_EepromExt_Write_addr+0 
	MOVLW       0
	MOVWF       FARG_EepromExt_Write_addr+1 
	MOVF        main_tmp_L0+0, 0 
	MOVWF       FARG_EepromExt_Write_val+0 
	CALL        _EepromExt_Write+0, 0
;Application.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,57 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,58 :: 		Lcd_Out_CP("Teste EEPROM EXT");
	MOVLW       ?lstr3_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,59 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,60 :: 		if(i == 0x5A)
	MOVF        main_i_L0+0, 0 
	XORLW       90
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Application.c,62 :: 		Lcd_Out_CP("       OK");
	MOVLW       ?lstr4_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,63 :: 		}
	GOTO        L_main6
L_main5:
;Application.c,66 :: 		Lcd_Out_CP("      ERRO");
	MOVLW       ?lstr5_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,67 :: 		}
L_main6:
;Application.c,68 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
;Application.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,71 :: 		Lcd_Cmd(_LCD_FIRST_ROW);
	MOVLW       128
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,72 :: 		Lcd_Out_CP("      Done");
	MOVLW       ?lstr6_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,73 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Application.c,74 :: 		Lcd_Out_CP("   Press RST");
	MOVLW       ?lstr7_Application+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Application+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Application.c,78 :: 		while(1);
L_main8:
	GOTO        L_main8
;Application.c,80 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
