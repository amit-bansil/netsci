int mid = 400;
int top = 50;

int headwidth = 200;
int headheight = 100;

float neckwidth = headwidth * 0.2;
float neckheight = headheight * 0.6;

float legwidth = 0.24 * headwidth;
float legheight = headheight * 1.5;

float armwidth = 0.3 * headwidth;
float armheight = headheight * 1.6;

float bodywidth = headwidth * 1.2;
int bodyheight = headheight * 2;

int jump = 0;
int veloUp = 0;
int accelUp = 2;
int gravity = 1;

void setup () {
  size(800, 600);  
}

void draw() {
  
  fill (200);
  rect (0, 0, width, height);
  fill (50);
    
  rect(mid-headwidth/2, -jump + top, headwidth, headheight); //head
  rect(mid-neckwidth/2, -jump + top+headheight, neckwidth, neckheight); //neck
  rect(mid-bodywidth/2, -jump + top+headheight+neckheight, bodywidth, bodyheight); //body
  rect(mid-legwidth/2-legwidth, -jump + top+headheight+neckheight+bodyheight, legwidth, legheight); //leftleg
  rect(mid+legwidth/2, -jump + top+headheight+neckheight+bodyheight, legwidth, legheight); //rightleg
  rect(mid-bodywidth/2-armwidth, -jump + top+headheight+neckheight, armwidth, armheight); //leftarm
  rect(mid+bodywidth/2, -jump + top+headheight+neckheight, armwidth, armheight); //rightarm
  
  jump += veloUp;
  if(mousePressed){
    veloUp += accelUp;
  }
  if(jump < 0){
    jump = 0;
  }else{
    veloUp -= gravity;
  }
}
