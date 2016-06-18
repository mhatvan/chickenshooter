//Klasse: Moorhuhn
//Objekt: knopf1
// Methode: void draw, void mousePressed etc.
// Variable: int x = 1;
// in Klasse initiialisiert, in MoorhuhnGame definiert
//this. in Klasse verwenden damit das Programm sich auskennt, was gemeint is
// knopf 1 = Platzhalter, new Moorhuhn = es wird zugewiesen
// Programm geht durch knopf 1 zeichnen, aha zeichnen -> Klasse und führt void zeichnen aus!
//im Konstruktor Werte definieren
//dann knopf 1 = new Moorhuhn und die definierten Werte, die man will eintragen
// (int) = Konvertierung von int in ein float -> für random Werte zb

int punktezaehler = 0;
int schuesse = 10;
int xmunition = 10;
int ymunition = 645;

boolean treffer = false;
boolean reload = false;

PImage background;
PImage bild1;
PImage bild2;
PImage bild3;
PImage bild4;
PImage fadenkreuz;
PImage munition;
PImage nachladen;

Huhn objekt1;
Huhn objekt2;
Huhn objekt3;
Huhn objekt4;

import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioSample shot;

void setup()
{
  size(1280, 720);

  //BILDER WERDEN EINMAL GELADEN
  background = loadImage ("Bild_6_Huehnerstall.jpg"); // loadImage immer in setup, resize etc. in die draw
  fadenkreuz = loadImage("Fadenkreuz.png");
  munition = loadImage("barrett_ammo_416_match.png");
  bild1 = loadImage("chicken.png");
  bild2 = loadImage("buff-orpington-hen.png");
  bild3 = loadImage("Huhn-201020346437.png");
  bild4 = loadImage("barred-rock-chicken.png");
  nachladen = loadImage("Bitte Nachladen!.png");

  textSize(32);

  //HÜHNER ERSCHEINEN
  objekt1 = new Huhn((int) random(-300, -100), (int) random(100, 600), 200, 200, bild1, (int) random(2, 4)); // X-Achse, Y-Achse, Größe, Größe, Bild, Geschwindigkeit
  objekt2 = new Huhn((int) random(-300, -100), (int) random(100, 600), 150, 150, bild2, (int) random(2, 6));
  objekt3 = new Huhn((int) random(-300, -100), (int) random(100, 600), 250, 250, bild3, (int) random(2, 8));
  objekt4 = new Huhn((int) random(-300, -100), (int) random(100, 600), 300, 300, bild4, (int) random(2, 8));

  //SOUND
  minim = new Minim (this);
  
  // Audiodatei in das Object 'player' laden
  player = minim.loadFile ("Domino's Techno Chicken - The Music Video!!!.mp3");
  // Audiodatei abspielen
  player.play ();

  // Audiodatei in das Object 'shot' laden
  shot = minim.loadSample ("gun-gunshot-02.wav");
}

void draw()
{
  background.resize (1280, 720);
  background (background);

  //PUNKTEZÄHLER
  text("Punkte: " + punktezaehler, 10, 40);

  //BEWEGUNG DER HÜHNER
  objekt1.zeichnen();
  objekt2.zeichnen();  
  objekt3.zeichnen(); 
  objekt4.zeichnen();

  noCursor();

  //FADENKREUZ
  fadenkreuz.resize (75, 75);
  image (fadenkreuz, mouseX, mouseY);

  for (int i = 0; i < schuesse; i++)
  {
    munition.resize (50, 50);
    image (munition, xmunition*2*i, ymunition);
  }

  // Relative Abspielposition im Stück ermitteln
  float playPos = player.position ();
  float playLen = player.length ();
  float xpos = (playPos / playLen) * width;

  if (schuesse == 0)
  {
    image (nachladen, 0, 0);
  }
}

void mousePressed() 
{
  //WEGHUPFEN
  objekt1.klick();
  objekt2.klick();
  objekt3.klick();
  objekt4.klick();

  //NACHLADEN+SHOT TRIGGER
  if (schuesse > 0 )
  {
    schuesse--;
    reload = false;
    shot.trigger();
  }
  else
  {
    println("Bitte Nachladen!");
    reload = true;
  }
}

void keyPressed()
{
  //ANZAHL SCHÜSSE
  if (keyPressed == true & key == ENTER)
    schuesse = 10;
}

