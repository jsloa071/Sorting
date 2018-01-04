/*  Module 6.15 : Sort your Own Stuff
    Question 1      
    Description: This program creates an array of dots with random
    brightness values. Each time it runs, a different hue and saturation are selected
    for the array of dots. The sorting algorithm sorts the dots horizontally
    on screen by brightness, such that the darkest dot appears on the left side
    of the window, and the dots gradually become lighter toward the right. */
    
//global variables
final int numDots = 8;
int dotWidth, spacing; //for drawing dots
int hue,sat; //constant hue and saturation values for dot colors

class Dot
{
  int x;
  int b; 
  final int h = hue;
  final int s = sat;
  final int y = height/2;
  final int size = dotWidth;
  
  Dot(int b)
  {
    this.b = b;  
  }
}
//create array of dots
Dot[] dots = new Dot[numDots];

void setup()
{
  size(500,500);
  colorMode(HSB,255);
  background(255);
  strokeWeight(2);
  stroke(255);
  
  //declare dot and color dimensions to be used throughout program
  dotWidth = (width*3/4) / numDots;
  spacing = (width - numDots*dotWidth)/(numDots+1);
  hue = (int)random(255);
  sat = (int)random(255);
  
  //initialize array (assigns random b values)
  for (int i = 0; i < numDots; i++)
  {
    dots[i] = randomDot();
  }
  
}

void draw()
{
  //sort array and draw the dots
  selectionSort(dots);
  for (int i = 0; i < numDots; i++)
  {
    dots[i].x = ((i+1)*spacing)+(i*dotWidth)+(dotWidth/2);
    drawDot(dots[i]);
  }
}

//function for creating a random instance of Dot
//returns a Dot object
Dot randomDot()
{
    Dot newDot = new Dot((int)random(20,235));
    return newDot;
}

//drawing function where fill color changes depending on brightness
//accepts dot object as parameter
void drawDot(Dot dot)
{
  fill(dot.h, dot.s, dot.b);
  ellipse(dot.x, dot.y, dot.size, dot.size);
}

//sorting algorithm
//sorts dots by brightness value by searching for smallest
//b value in array and switching it for the current index
//note: switches only the brightness value, the other attributes are fixed
void selectionSort(Dot[] dotArray)
{
  int currentIndex = 0;
  while (currentIndex < dotArray.length)
  {
    int outerIndex = currentIndex+1;
    int minIndex = currentIndex;
    while (outerIndex < dotArray.length)
    {
      if (dotArray[outerIndex].b < dotArray[minIndex].b)
      {
        minIndex = outerIndex;
      }
      outerIndex++;
    }
    Dot temp = dotArray[currentIndex];
    dotArray[currentIndex] = dotArray[minIndex];
    dotArray[minIndex] = temp;
    currentIndex++;
  }
}
