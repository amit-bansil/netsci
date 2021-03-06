int grid_width = 640;
int grid_height = 480;
//parameters
float faceHeight  = 20;
float faceWidth   = faceHeight * 1.6;

float outerBorder = 50;
int numXFaces   = 20;
int numYFaces   = 20;

float gridWidth  = grid_width - outerBorder * 2;
float gridHeight = grid_height - outerBorder * 2;
float gridCellWidth = gridWidth / numXFaces;
float gridCellHeight = gridHeight / numYFaces;

float eyeSize     = faceHeight / 3 ;
float eyeWidth    = eyeSize;
float eyeHeight   = eyeSize;
float leftEyeX    = faceWidth * .1;
float rightEyeX   = faceWidth * .5;
float eyeY        = faceHeight * .1;

float smileXStart = faceWidth * .2;  
float smileXEnd   = faceWidth * .7;
float smileY      = faceHeight * .7;

int christmasRed   = #7C2525;
int christmasGreen = #257C33;
float chanceRed = 0.7;

boolean[][] colors = new boolean[numXFaces][numYFaces];

void setup(){
  size (grid_width, grid_height);
  randomSeed(1243);
}
void mouseClicked(){
  int cellX = (int)((mouseX-outerBorder) / gridCellWidth);
  int cellY = (int)((mouseY-outerBorder) / gridCellHeight);
  colors[cellX][cellY] = ! colors[cellX][cellY];
}
void draw(){
  
for (int cellXIndex = 0; cellXIndex < numXFaces; cellXIndex += 1){
  for(int cellYIndex = 0; cellYIndex < numYFaces; cellYIndex += 1){
    if(colors[cellXIndex][cellYIndex]){
      fill(christmasRed);
    }else{
      fill(christmasGreen);
    }
    pushMatrix();
    float cellX = cellXIndex * gridCellWidth + outerBorder;
    float cellY = cellYIndex * gridCellHeight + outerBorder;
    float cellCenterX = cellX + gridCellWidth / 2;
    float cellCenterY = cellY + gridCellHeight / 2;
    rect(cellX, cellY, gridCellWidth, gridCellHeight);
    
    float faceX = cellCenterX - faceWidth / 2;
    float faceY = cellCenterY - faceHeight / 2;
    translate(faceX, faceY);
    rect(0, 0, faceWidth, faceHeight);
    rect(leftEyeX, eyeY, eyeWidth, eyeHeight);
    rect(rightEyeX, eyeY, eyeWidth, eyeHeight);
    line(smileXStart, smileY, smileXEnd, smileY);
    popMatrix();
  }
}
}
