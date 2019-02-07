GOL gol;

void setup() {
  //size(640, 360);
   size(840, 560);  //size of canvas
  frameRate(24);
  gol = new GOL();
}

void draw() {
  background(255);

  gol.generate();  //calling func generate
  delay(150);    //for clear visibilty of cells
  gol.display();  //display cells (each black square = 1 live cell)
}


void mousePressed() {
  gol.init();      // reset board when mouse is pressed
}
