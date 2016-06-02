import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioInput input;
PImage scope;
void setup()  {
  size(1600, 900, P3D);
  noStroke();
  fill(204);
  scope = loadImage("targetscope.png");
    minim = new Minim(this);
  player = minim.loadFile("gunsound.mp3");
  input = minim.getLineIn();
}
String test = "You shot the target";
int x = 800;
int y = 450;
int z = -100;
int bx = 50;
int by = 50;
int filltest = 10;
int lx = 1200;
int ly  = 0;
int lz  = 0;
Boolean shot = false;
void draw()  {

  background(0);

 
 camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

  translate(x, y, z);
  stroke(255);
  fill(200, 200, 200);
  box(200);
   
 translate(400, -400, 400);

 sphere(100);
 translate(-400, 400, -400);
  translate(800, 0, 0);
 box(200);
 translate(0, 0, 800);
 box(200);
 translate(-800, 0, 0);
 box(200);

 if(keyPressed && keyCode == UP){
 z+=15;
 }if(keyPressed && keyCode == DOWN) {
 z-=15;
 }if(keyPressed && keyCode == LEFT){
 x+= 15;
 }if(keyPressed && keyCode == RIGHT){
 x-= 15;
 }
 translate(-x, -y, -z);
 translate(-800, 0, 0);
 translate(0, 0, -800);
 translate(800, 0, 0);

if(mousePressed && x <= 920 && x >= 700){
  if(shot == false){
print("begin- ");
shot = true;
}
}
 if(mousePressed){
   noFill();
   stroke(0, 255, 0);
   player.play();
   translate(mouseX, mouseY, z-1600);
 sphere(bx);
 translate(-mouseX, -mouseY, z+1600);
 if( bx > 0){
bx -= 3;
by -=3;
 }

}else{
  fill(255, 0, 0);
 text(x,mouseX, mouseY);
  text(y,mouseX+100, mouseY);
  player.rewind();
  textSize(20);
   text("+", mouseX-10, mouseY);

}
}
void mouseReleased() {
 bx = 50;
 by = 50;
 shot = false;
}
