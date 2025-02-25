void sendMessage()
{
  int messageCode;
  String Stringtmp;
  if (queue.size() >0 && messageFlag == false)
  {
    messageCode = queue.get(0);
    switch(messageCode) {
      case 33:
        Stringtmp = ""+char(33);
        println(Stringtmp);
        serial.write(Stringtmp );
        break;

      case 34:
        Stringtmp = ""+char(34);
        println(Stringtmp);
        serial.write(Stringtmp );
        break;
        

      case 35:
        Stringtmp = ""+char(35);
        println(Stringtmp);
        serial.write(Stringtmp );
        break;

      case 36:
        Stringtmp = ""+char(36);
        println(Stringtmp);
        serial.write(Stringtmp );
        break;

      case 37:
        Stringtmp = ""+char(37);
        println(Stringtmp);
        serial.write(Stringtmp );
        break;
      
      case 38:
        Stringtmp = ""+char(38) + char(6) + char((year() - 2000) % 255) + char(month()) + char(day()) + char(hour());
        println(Stringtmp);
        serial.write(Stringtmp );
        break;

      default:
      println("Invalid MessageCode");
      break;
    }
    messageFlag = true;
  }
}

void acceptMessage() //Процедура приёма ответов
{
  int messageCode;

  if (serial != null && messageFlag) {
   
    if (serial.available() > 0) {
      messageCode = queue.get(0);
      queue.remove(0);
      switch(messageCode) {
      case 33:
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 161) {
          // Серийный номер модема  байт 2 - 9
          inBuffer = serial.readChar(); 
          print(inBuffer+" "); 
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          
          
          // Серийный номер батареи  байт 10 - 17
          inBuffer = serial.readChar(); 
          print(inBuffer+" "); 
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          inBuffer = serial.readChar(); 
          print(inBuffer+" ");  
          
          inBuffer = serial.readChar(); //XOr
          print(inBuffer+" "); 
          
          } else
          {
            println("Invalid data");
          }
        }
        break;

      case 34:
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 162) {
          inBuffer = serial.readChar(); // Емкость EEPROM 
          print(inBuffer+" ");
          
          Ftmp = 0; //Тысяч секунд сна
          Ftmp += serial.readChar() * 256;
          Ftmp += serial.readChar();
          print(Ftmp + " "); 
          
          Ftmp = 0; //Десятков секунд работы сенсора 
          Ftmp += serial.readChar() * 256;
          Ftmp += serial.readChar();
          print(Ftmp + " "); 
          
          Ftmp = 0; //Десятков секунд работы передачи данных
          Ftmp += serial.readChar() * 256;
          Ftmp += serial.readChar();
          print(Ftmp + " "); 
          
          inBuffer = serial.readChar(); // Год
          print(inBuffer+" ");
          inBuffer = serial.readChar(); // Месяц
          print(inBuffer+" ");
          inBuffer = serial.readChar(); // День
          print(inBuffer+" ");
          inBuffer = serial.readChar(); // Час
          print(inBuffer+" ");
          
          Ftmp = 0; //Количество циклов измерений на данной батарее
          Ftmp += serial.readChar() * 256;
          Ftmp += serial.readChar();
          print(Ftmp + " "); 
          
          inBuffer = serial.readChar(); // Текущее напряжение батареи
          print(inBuffer+" ");
          
          inBuffer = serial.readChar(); // XorCS
          print(inBuffer+" ");
          
          }else
          {
            println("Invalid data");
          }
        }
        break;

      case 35:
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 163) {
            
            
          }else
          {
            println("Invalid data");
          }
        }
        break;

      case 36:
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 164) {
            inBuffer = serial.readChar();
            
          }else
          {
            println("Invalid data");
          }
        }
          
        break;

      case 37:
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 165) {
            // Ом шлейфа
            Ftmp = 0; 
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " "); 
            
            //Напряжение на шлейфе при измерении, Вольт*100 
            Ftmp = 0; 
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " "); 
            
            
           inBuffer = serial.readChar(); 
          }else
          {
            println("Invalid data");
          }
        }
        break;
      



      case 38: //Парсим показания датчика
        while (serial.available() > 0) {
          //inBuffer = serial.readBytes();
          char inBuffer = serial.readChar(); // Кол-во байт в ответе
          print(int(inBuffer)+" ");
          inBuffer = serial.readChar();//Проверка успешности
          if (int(inBuffer) == 166) {
            //Парсим сырые данные Mx
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим сырые данные Gx
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим сырые данные My
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим сырые данные Gy
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим сырые данные Mz
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим сырые данные Gz
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим угловые данные Roll
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10 + " ");

            //Парсим угловые данные MRoll
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10 + " ");

            //Парсим угловые данные Inc
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10 + " ");

            //Парсим угловые данные Tmag
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10 + " ");

            //Парсим угловые данные Azimuth
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10 + " ");

            //Парсим угловые данные Tgrav
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/10000 + " ");

            //Парсим угловые данные Temp
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/100 + " ");

            //Парсим угловые данные Voltage
            Ftmp = 0;
            Ftmp += serial.readChar() * 256;
            Ftmp += serial.readChar();
            print(Ftmp/100 + " ");

            //Парсим контроль чётности
            inBuffer = serial.readChar();
            print(int(inBuffer)+" ");
          } else
          {
            println("Invalid data");
          }
        }
        
        break;


      default:
        println("Invalid MessageCode");
        break;
      }
      println();
    }
   messageFlag = false; 
  }
}
