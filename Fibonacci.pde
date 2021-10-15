void setup() {
  size(500, 500);
  noLoop();
}

void draw()
{
  int deflectionAngle = 5; // Angle (degrees) of deflection between levels
  int randIndex;
  int deflector = 0;
  Node[] nodeArray = {(new Node(250, 500, false, false))};
  for (int i = 1; i < 10; ++i) { // Loop for each level.
    print("\nLevel: " + i + " Fibonacci: " + fibNum(i) + "\n");
    Node[] newNodeArray = {};
    for (int j = 0; j < fibNum(i); ++j) // Loop for each line.
    {
      while (true)
      {
        randIndex = int(random(0, nodeArray.length));    
        if (!(nodeArray[randIndex]).hasRightBranch || !(nodeArray[randIndex]).hasLeftBranch)
        {
          break;
        }
      }
      int x1 = (nodeArray[randIndex]).xpos;
      int y1 = (nodeArray[randIndex]).ypos;
      int y2 = y1 - 50;
      if (!(nodeArray[randIndex]).hasRightBranch && !(nodeArray[randIndex]).hasLeftBranch)
      {
        int deflectorOptions[] = {-1, 1};
        deflector = deflectorOptions[int(random(0,2))]; // Kinda a janky way to determine, but it works!
        if (deflector == 1) 
        { 
          nodeArray[randIndex].hasRightBranch = true;
        } else 
        {
          nodeArray[randIndex].hasLeftBranch = true;
        }
      } else if (nodeArray[randIndex].hasLeftBranch)
      {
        deflector = 1;
        nodeArray[randIndex].hasRightBranch = true;
      } else if (nodeArray[randIndex].hasRightBranch)
      {
        deflector = -1;
        nodeArray[randIndex].hasLeftBranch = true;
      } else
      {
        print("ERROR!!!");
      }
      int x2 = x1 + int(deflector * (25 * tan(deflectionAngle * (PI/180))));
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 5, 5);
      newNodeArray = (Node[])append(newNodeArray, new Node(x2, y2, false, false));
    }    
    nodeArray = newNodeArray;
    deflectionAngle = deflectionAngle + 8;
  }
}

class Node { // Node class. A node has an X and Y position, and can possess a right and left branch. 
  int xpos;
  int ypos;
  boolean hasRightBranch;
  boolean hasLeftBranch;

  Node(int xpos, int ypos, boolean hasLeftBranch, boolean hasRightBranch){
    this.xpos = xpos;
    this.ypos = ypos;
    this.hasLeftBranch = hasLeftBranch;
    this.hasRightBranch = hasRightBranch;
  }
}

int fibNum(int n) { // Determines the nth number of the Fibonacci sequence.
  float goldenRatio = ((1 + sqrt(5)) / 2);
  return int((((pow(goldenRatio, n+1)) - pow((1 - goldenRatio), n+1)) / sqrt(5)));
}

// Debug Statements... To copy + paste

//print("Node Array Index: " + j + " " +
//"X Pos: " + nodeArray[j].xpos + " " +
//"Y Pos: " + nodeArray[j].ypos + " " +
//"Right Branch: " + nodeArray[j].hasRightBranch + " " +
//"Left Branch: " + nodeArray[j].hasLeftBranch + "\n");
//print("NodeArray Length: " + nodeArray.length + "\n");
//print("RandIndex: " + randIndex + "\n");
//print("Node Array at RandIndex: " + nodeArray[randIndex].xpos + "\n");
//print((!(nodeArray[randIndex]).hasRightBranch || !(nodeArray[randIndex]).hasLeftBranch) + "\n");
//print("New node array length: " + newNodeArray.length + "\n");
//print("loop: " + j + " ");
//print("X1: " + x1 + " Y1: " + y1 + " X2: " + x2 + " Y2: " + y2 + "\n");
//print("New Node Array X Position:" + newNodeArray[j].xpos + "\n");