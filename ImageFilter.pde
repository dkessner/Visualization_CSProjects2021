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


