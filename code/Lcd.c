
void InitLCD()
{
  TRISD=0;
  PORTD=0;
  TRISE=0;
  PORTE=0;

  Lcd_Init();                // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
  Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off

  Lcd_Out(1,2,"TKH & Coventry");
  Lcd_Out(2,1,"ES Final Project");
  delay_ms(3000);
  Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display

}