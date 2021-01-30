//
// ImageFilter
//


void applyMirrorFilter(PGraphics pg)
{
    pg.loadPixels();

    for (int i=0; i<height; i++)
    for (int j=width/2; j<width; j++)
    {
        int index = i*width + j; 
        int from = i*width + width-j; 
        pg.pixels[index] = pg.pixels[from];
    }

    pg.updatePixels();
}


void applyFadeFilter(PGraphics pg)
{
    pg.loadPixels();
    for (int i=0; i<pg.pixels.length; i++)
    {
        int c = pg.pixels[i];
        int a = (c & 0xff000000) >> 24;
        int r = (c & 0x00ff0000) >> 16;
        int g = (c & 0x0000ff00) >> 8;
        int b = c & 0x000000ff;

        if (a>0) a--;
        if (r>0) r--;
        if (g>0) g--;
        if (b>0) b--;

        pg.pixels[i] = (a<<24) | (r<<16) | (g<<8) | b;
    }
    pg.updatePixels();
}


void applyGreyscaleFilter(PGraphics pg)
{
    pg.loadPixels();
    for (int i=0; i<pg.pixels.length; i++)
    {
        int c = pg.pixels[i];
        int a = (c & 0xff000000) >> 24;
        int r = (c & 0x00ff0000) >> 16;
        int g = (c & 0x0000ff00) >> 8;
        int b = c & 0x000000ff;

        int m = (r+g+b)/3;

        pg.pixels[i] = (a<<24) | (m<<16) | (m<<8) | m;
    }
    pg.updatePixels();
}

void applyPurpleFilter(PGraphics pg)
{
    pg.loadPixels();
    for (int i=0; i<pg.pixels.length; i++)
    {
        int c = pg.pixels[i];
        int a = (c & 0xff000000) >> 8;
        int r = (c & 0x00ff0000) >> 16;
        int g = (c & 0x0000ff00) >> 16;
        int b = c & 0x000000ff;

        int m = (r+g+b)/3;

        pg.pixels[i] = (a<<8) | (m<<16) | (m<<16) | m;
    }
    pg.updatePixels();
}

void applyGreenFilter(PGraphics pg){
    pg.loadPixels();
    for (int i=0; i<pg.pixels.length; i++)
    {
        int c = pg.pixels[i];
        int a = (c & 0xff000000) >> 16;
        int r = (c & 0x00ff0000) >> 8;
        int g = (c & 0x0000ff00) >> 8;
        int b = (c & 0x000000ff) >> 0;

        int m = (r+g+b)/3;

        pg.pixels[i] = (a<<16) | (m<<8) | (m<<8) | m;
    }
    pg.updatePixels();
}

void applyBlurFilter(PGraphics pg, int radius){
  pg.loadPixels();
  
  for(int i=0; i<height; i++){
    for(int j=0; j<width; j++){
      
      if(i-radius>0 && j-radius>0 && i+radius<height && j+radius<width){
      
      int aTotal = 0;
      int rTotal = 0;
      int gTotal = 0;
      int bTotal = 0;
      int count = 0;
      
      for(int k=i-radius; k<i+(radius+1); k++){
        for(int m=j-radius; m<j+(radius+1); m++){
          aTotal += getA(pg.pixels[k+width+m]);
          rTotal += getR(pg.pixels[k*width+m]);
          gTotal += getG(pg.pixels[k*width+m]);
          bTotal += getB(pg.pixels[k*width+m]);
          count ++;
        }
      }
      
      int a = aTotal/count;
      int r = rTotal/count;
      int g = gTotal/count;
      int b = bTotal/count;
      
      pg.pixels[i*width+j] = (a<<24) | (r<<16) | (g<<8) | b;
      
      }
      
      else{
        continue;
      }
    }
    }
    pg.updatePixels();
  }
 
  
 

int getA(int c){
  int a = (c & 0xff000000) >> 24;
  return a;
}


int getR(int c){
  int r = (c & 0x00ff0000) >> 16;
  return r;
}

int getG(int c){
  int g = (c & 0x0000ff00) >> 8;
  return g;
  
}

int getB(int c){
  int b = (c & 0x000000ff) >> 0;
  return b;
}