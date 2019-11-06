final int NUM = 6;
final float SPEED = 0.01;
final int RATIO = 20;
float angleC = 0;
float angleCC = 0;
boolean clockwise = true;

void setup(){
  background(180);
  size(500,500);
}

void drawPicture(){
  noFill();
  float cx = width/2;
  float cy = height/2;
  float spacing = (width - width / 10.0)/12;
  for(int i=1; i<=NUM; i++){
    ellipse(cx,cy,2*i*spacing,2*i*spacing);
    int lineN = int(PI * 2*i*spacing / RATIO);
    float theta = 2*PI/lineN;
    float angle = angleC;
    if(!clockwise)
      angle = angleCC;
    if(i != NUM){
      for(int j=0; j<lineN; j++){
        float x1 = cx + i*spacing*cos(angle + j*theta);
        float y1 = cy + i*spacing*sin(angle + j*theta);
        float x2 = cx + (i+1)*spacing*cos(angle + j*theta);
        float y2 = cy + (i+1)*spacing*sin(angle + j*theta);
        if(j==0 && mousePressed)
          stroke(255,0,0);
        else
          stroke(0);
        line(x1,y1,x2,y2);
      }
    }
    clockwise = !clockwise;
  }
}

void draw(){
  background(180);
  drawPicture();
  angleC+=SPEED;
  angleCC-=SPEED;
}

void mousePressed(){
}

void mouseReleased(){
}
