void createInteface()
{
  cp5 = new ControlP5(this);

  cp5.addButton("refresh").setPosition(20, 20).setSize(100, 50).linebreak();

  cp5.addButton("close").setPosition(20, 130).setSize(100, 50).linebreak();
  
  cp5.addButton("send33").setPosition(width/2 - 50, height/2-300).setSize(100, 50).linebreak();
  cp5.addButton("send34").setPosition(width/2 - 50, height/2-250).setSize(100, 50).linebreak();
  cp5.addButton("send35").setPosition(width/2 - 50, height/2-200).setSize(100, 50).linebreak();
  cp5.addButton("send36").setPosition(width/2 - 50, height/2-150).setSize(100, 50).linebreak();
  cp5.addButton("send37").setPosition(width/2 - 50, height/2-100).setSize(100, 50).linebreak();
  cp5.addButton("send38").setPosition(width/2 - 50, height/2-25).setSize(100, 50).linebreak();
  


  cp5.addScrollableList("comlist")
    .setPosition(0, 0)
    .setSize(200, 100)
    .setBarHeight(25)
    .setItemHeight(20)
    .close()
    .setFont(createFont("arial", 14))
    .linebreak();

  String list[] = Serial.list();
  cp5.get(ScrollableList.class, "comlist").addItems(list);

  myTextarea = cp5.addTextarea("txt")
    .setPosition(20, height-320)
    .setSize(300, 260)
    .setFont(createFont("arial", 14))
    .setLineHeight(14)
    .setColor(color(128))
    .setColorBackground(color(255, 100))
    .setColorForeground(color(255, 100));
  ;
}

void refresh() {
  String list[] = Serial.list();
  cp5.get(ScrollableList.class, "comlist").setItems(list);
}

void comlist(int n) {
  portName = Serial.list()[n];
  serial = new Serial(this, portName, connectingSpeed);
}

void close_port() {
  serial.stop();
}



void send33() {
  queue.append(33);
  
}

void send34() {
  queue.append(34);
  
}

void send35() {
  queue.append(35);
  
}

void send36() {
  queue.append(36);
  
}

void send37() {
  queue.append(37);
  
}

void send38() {
  queue.append(38);
  
}
