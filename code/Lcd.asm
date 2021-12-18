
_InitLCD:

;Lcd.c,2 :: 		void InitLCD()
;Lcd.c,4 :: 		TRISD=0;
	CLRF        TRISD+0 
;Lcd.c,5 :: 		PORTD=0;
	CLRF        PORTD+0 
;Lcd.c,6 :: 		TRISE=0;
	CLRF        TRISE+0 
;Lcd.c,7 :: 		PORTE=0;
	CLRF        PORTE+0 
;Lcd.c,9 :: 		Lcd_Init();                // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Lcd.c,10 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,11 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,13 :: 		Lcd_Out(1,2,"TKH & Coventry");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lcd.c,14 :: 		Lcd_Out(2,1,"ES Final Project");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Lcd.c,15 :: 		delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_InitLCD0:
	DECFSZ      R13, 1, 1
	BRA         L_InitLCD0
	DECFSZ      R12, 1, 1
	BRA         L_InitLCD0
	DECFSZ      R11, 1, 1
	BRA         L_InitLCD0
	NOP
;Lcd.c,16 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Lcd.c,18 :: 		}
L_end_InitLCD:
	RETURN      0
; end of _InitLCD
