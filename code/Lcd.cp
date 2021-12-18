#line 1 "P:/ES_Final_Project_AC_System/code/Lcd.c"

void InitLCD()
{
 TRISD=0;
 PORTD=0;
 TRISE=0;
 PORTE=0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,2,"TKH & Coventry");
 Lcd_Out(2,1,"ES Final Project");
 delay_ms(3000);
 Lcd_Cmd(_LCD_CLEAR);

}
