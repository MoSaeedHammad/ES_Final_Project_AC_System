#line 1 "P:/ES_Final_Project_AC_System/code/Application.c"
#line 1 "p:/es_final_project_ac_system/code/i2c_manual.h"





extern void i2c_init(void);
extern void i2c_start(void);
extern void i2c_stop(void);
extern void i2c_wb(unsigned char val);
extern unsigned char i2c_rb(unsigned char ack);
extern void i2c_acktst(unsigned char val);
#line 1 "p:/es_final_project_ac_system/code/eeprom_ext.h"

unsigned char EepromExt_Read(unsigned int addr);

void EepromExt_Write(unsigned int addr, unsigned char val);
#line 1 "p:/es_final_project_ac_system/code/rtc.h"
void Rtc_GetDateTime(volatile char date[], volatile char time[]);
#line 1 "p:/es_final_project_ac_system/code/lcd.h"

sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D0 at RD0_bit;
sbit LCD_D1 at RD1_bit;
sbit LCD_D2 at RD2_bit;
sbit LCD_D3 at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D0_Direction at TRISD0_bit;
sbit LCD_D1_Direction at TRISD1_bit;
sbit LCD_D2_Direction at TRISD2_bit;
sbit LCD_D3_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void InitLCD();
#line 6 "P:/ES_Final_Project_AC_System/code/Application.c"
volatile char date[10];
volatile char time[10];

void main()
{
 unsigned char i;
 unsigned char tmp;

 TRISB=0x00;
 TRISC=0x00;
 TRISD=0x00;
 TRISE=0x00;


 initLCD();
 i2c_init();



 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Test RTC");
 Lcd_Cmd(_LCD_SECOND_ROW);
 Rtc_GetDateTime(date, time);

 Lcd_Out_CP(date);
 delay_ms(2000);
 for(i=0;i<20;i++)
 {
 Rtc_GetDateTime(date, time);
 Lcd_Cmd(_LCD_SECOND_ROW);;
 Lcd_Out_CP(time);
 delay_ms(500);
 }



 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_FIRST_ROW);
 Lcd_Out_CP("Test EEPROM EXT");


 tmp=EepromExt_Read(10);
 lcd_Out_CP(tmp);

 EepromExt_Write(10,0xA5);
 EepromExt_Write(10,0x5A);
 i= EepromExt_Read(10);

 EepromExt_Write(10,tmp);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_FIRST_ROW);
 Lcd_Out_CP("Teste EEPROM EXT");
 Lcd_Cmd(_LCD_SECOND_ROW);
 if(i == 0x5A)
 {
 Lcd_Out_CP("       OK");
 }
 else
 {
 Lcd_Out_CP("      ERRO");
 }
 delay_ms(1000);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_FIRST_ROW);
 Lcd_Out_CP("      Done");
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Out_CP("   Press RST");



 while(1);

}
