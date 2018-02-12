boolean gameOver=false;
int x=400;
int y=700;
int Score= 0;

int[]Xs= new int[5];
int[]Ys= new int[5];
int[]xs= new int[5];
int[]ys= new int[5];
int[]Yspeed= new int[5];
int[]ID= new int[5];
int[]IDs= new int[5];
PImage Background;
PImage Boy;
PImage Bomb;
PImage Apple;
PImage Candy;
PImage Choco;
PImage Grape; 
PImage Meat;
PImage Fail;

void setup()
{
  size(800, 800);
  imageMode(CENTER);
  rectMode(CENTER);



  for (int i=0; i<5; i++)
  {
    Xs[i]= (int)random(0, 800);
    Ys[i]= (int)random(-400, 0);
    xs[i]= (int)random(0, 800);
    ys[i]= (int)random(-400, 0);
    Yspeed[i]= (int)random(5, 10);
    ID[i]= 0;
    IDs[i]=int(random(0, 4));
  }


  Background=loadImage("Background.png");
  Background.resize(800, 800);

  Boy=loadImage("Boy.png");
  Boy.resize(200, 200);

  Bomb=loadImage("Bomb.png");
  Bomb.resize(80, 80);

  Apple=loadImage("Apple.png");
  Apple.resize(80, 80);

  Candy=loadImage("Candy.png");
  Candy.resize(80, 80);

  Choco=loadImage("Choco.png");
  Choco.resize(80, 80);

  Grape=loadImage("Grape.jpg");
  Grape.resize(80, 80);

  Meat=loadImage("Meat.png");
  Meat.resize(80, 80);

  Fail=loadImage("Fail.jpg");
  Fail.resize(800, 800);
}



void draw()
{
  background(0);
  image(Background, 400, 400);
  image(Boy, x, 680);


  if (keyPressed)
  {
    if (key== 'd' || key== 'D')
    {
      x=x+6;
    }
    if (key== 'a' || key=='A')
    {
      x=x-6;
    }
  }
  if (x<0)
  {
    x=0;
  }
  if (x>800)
  {
    x=800;
  }

  if (gameOver==false)
  {
    for (int i=0; i<5; i++)
    {
      image(Bomb, Xs[i], Ys[i]);
      /*if(ID[i]==0)
       {
       image(Bomb,Xs[i],Ys[i]);
       }
       */
      if (IDs[i]==0)
      {
        image(Apple, xs[i], ys[i]);
      }
      if (IDs[i]==1)
      {
        image(Candy, xs[i], ys[i]);
      }
      if (IDs[i]==2)
      {
        image(Choco, xs[i], ys[i]);
      }
      if (IDs[i]==3)
      {
        image(Meat, xs[i], ys[i]);
      }
      if (IDs[i]==4)
      {
        image(Grape, xs[i], ys[i]);
      }

      ys[i]=ys[i]+Yspeed[i];
      Ys[i]=Ys[i]+Yspeed[i];


      if (Ys[i]>900 )
      {
        Xs[i]=(int)random(0, 800);
        Ys[i]=(int)random(-400, -200);
      }
      if ( ys[i]>900)
      {
        xs[i]=(int)random(0, 800);
        ys[i]=(int)random(-400, -200);
      }


      if (dist(xs[i], ys[i], x, 680)<120)
      {
        Score+=5;
        ys[i]=-200;
      }
      if (Ys[i]>900)
      {
        Ys[i]=-200;
      }
      if (ys[i]>900)
      {
        ys[i]=-200;
      }
      if (dist(Xs[i], Ys[i], x, 680)<120)
      {
        gameOver=true;
      }
    }
  }
  if (gameOver==true)
  {
    image(Fail, 400, 400);
    noLoop();
  }

  fill(255, 0, 0);
  rect(100, 100, 150, 150);
  textSize(40);
  fill(0, 0, 0);
  text("Score:", 40, 70);
  textSize(80);
  fill(0, 0, 0);
  text(millis()/1000+Score, 70, 150);

}