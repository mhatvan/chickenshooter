class Huhn
{
  int iX;
  int iY;

  int iWidth;
  int iHeight;

  PImage tiere;

  int iGeschwindigkeit;

  Huhn (int iX, int iY, int iWidth, int iHeight, PImage tiere, int iGeschwindigkeit) // <--- Konstruktor !
  {
    this.iX = iX;
    this.iY = iY;
    this.iWidth = iWidth;
    this.iHeight = iHeight;
    this.iGeschwindigkeit = iGeschwindigkeit;
    this.tiere = tiere;
  }

  Huhn() 
  {
  }

  void zeichnen()
  {
    //BEWEGUNG DER HÜHNER
    iX=iX+iGeschwindigkeit;

    //OBJEKTE ERSCHEINEN NEU WENN SIE AUS DEM AUSGABEFENSTER FLIEGEN
    if (iX > width)
      iX= (int) random (-500, -100);
    if (iY > height)
      iY= (int) random (100, 600);

    image(tiere, iX, iY+50*sin(radians(iX)), iWidth, iHeight); // größere Bilder werden zamgestaucht
  }

  void klick()
  {
    // WEGHUPFEN + PUNKTE BEKOMMEN
    if ( mouseX >= iX && mouseX < iX+iWidth
      && mouseY >= iY && mouseY < iY+iHeight && schuesse > 0)
    { 
      treffer = true;
      iX=(int)random (0, width); 
      iY=(int)random (0, 600);
      punktezaehler++;
      println("Punkte: " + punktezaehler);
    }
    else
    {
      treffer = false;
    }
  }
}

