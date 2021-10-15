void setup() {
  size(500, 500);
  noLoop();
}

/*
void draw() {
  int angle = 5;
  int fib = 0;
  float goldenRatio = ((1 + sqrt(5)) / 2);
  
  int[][] nodeArray = {{250,500}};
  for (int i = 1; i < 10; ++i) { // Loops for every level
    fib = floor((((pow(goldenRatio, i+1)) - pow((1 - goldenRatio), i+1)) / sqrt(5)));
    int bender = 1;
    int[][] newNodeArray = new int[fib][2];
    int[][] usedNodes = new int[fib][2]; // First digit: X value Second Digit: How many times used
    stroke(random(0,255), random(0,255), random(0,255));
    
    //print("Level: " + i + " ");
    //print("Fibonacci: " + fib + "\n");

    for (int j = 0; j < fib; ++j) // Loops for every line
    {
      int x1, y1;
      if (fib == 1)
      {
        x1 = nodeArray[0][0]; 
        y1 = nodeArray[0][1];
      } else {
        while (true) {
          // Randomly select a node from the array.
          int rand = int(random(0, nodeArray.length));
          // Check if it is used to the max.
          if (usedNodes[])
          // If not, assign and break loop.
          // If so, repeat.
          x1 = nodeArray[rand][0];
          y1 = nodeArray[rand][1];
        }
        usedNodes[j][0] = rand;
        usedNodes[j][1] = bender;
      }
      int x2 = x1 + int(bender * 25 * tan(angle * (PI/180))); 
      int y2 = y1 - 25;
      //print("X1: " + x1 + " Y1: " + y1 + " X2: " + x2 + " Y2: " + y2 + "\n");
      line(x1, y1, x2, y2);
      //newNodeArray[j][0] = x2;
      //newNodeArray[j][1] = y2;
      newNodeArray[j] = new Node(x2, y2, false, false)
      bender = bender * -1;
    }
    nodeArray = newNodeArray;
    angle = angle + 5;
  }
  
}
*/

void draw()
{
  int deflectionAngle = 5; // Angle (degrees) of deflection between levels
  int randIndex;
  int deflector = 0;
  Node[] nodeArray = {(new Node(250, 500, false, false))};
  Node[] newNodeArray = {};

  for (int i = 1; i < 5; ++i) { // Loop for each level.
    print("\nLevel: " + i + " Fibonacci: " + fibNum(i) + "\n");
    
    for (int j = 0; j < fibNum(i); ++j) // Loops for every line
    {
      while (true)
      {
        randIndex = int(random(0, nodeArray.length));
        //print("NodeArray Length: " + nodeArray.length + "\n");
        //print("RandIndex: " + randIndex + "\n");
        //print("Node Array at RandIndex: " + nodeArray[randIndex].xpos + "\n");
        //print((!(nodeArray[randIndex]).hasRightBranch || !(nodeArray[randIndex]).hasLeftBranch) + "\n");

        print("Origin nodes: \n");
        for (int w = 0; w < nodeArray.length; ++w)
        {
          print(nodeArray[w] + " ");
        }
        
        print("\n");
        print("Selected origin node: " + nodeArray + "\n");
        if (!(nodeArray[randIndex]).hasRightBranch || !(nodeArray[randIndex]).hasLeftBranch) // Somehow this is getting passed a null node
        {
          //print("BREAK!");
          break;
        }
      }
      int x1 = (nodeArray[randIndex]).xpos;
      int y1 = (nodeArray[randIndex]).ypos;
      int y2 = y1 - 50;
      if (!(nodeArray[randIndex]).hasRightBranch && !(nodeArray[randIndex]).hasLeftBranch)
      {
        int deflectorOptions[] = {-1, 1};
        deflector = deflectorOptions[int(random(0,2))]; // Find a better way to make random
        print("NO BRANCH TEST. DEFLECTOR SET TO " + deflector + ".\n" );
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
        //print("HAS LEFT BRANCH TEST");
      } else if (nodeArray[randIndex].hasRightBranch)
      {
        deflector = -1;
        nodeArray[randIndex].hasLeftBranch = true;
        //print("HAS RIGHT BRANCH TEST");
      } else
      {
        print("ERROR!!!");
      }
      //print(deflector);
      int x2 = x1 + int(deflector * (25 * tan(deflectionAngle * (PI/180))));
      line(x1, y1, x2, y2);
      newNodeArray = (Node[])append(newNodeArray, new Node(x2, y2, false, false));
      //print("New node array length: " + newNodeArray.length + "\n");
      //print("loop: " + j + " ");
      //print("X1: " + x1 + " Y1: " + y1 + " X2: " + x2 + " Y2: " + y2 + "\n");
      //print("New Node Array X Position:" + newNodeArray[j].xpos + "\n");
    }
    
    print("New Node Array: \n");
    for (int u = 0; u < newNodeArray.length; ++u)
    {
      print(newNodeArray[u] + " ");
    }
    print("\n");

    nodeArray = newNodeArray;
    deflectionAngle = deflectionAngle + 7;
  }
}

class Node {
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

int fibNum(int num) {
  float goldenRatio = ((1 + sqrt(5)) / 2);
  return int((((pow(goldenRatio, num+1)) - pow((1 - goldenRatio), num+1)) / sqrt(5)));
}

// Debug

//print("Node Array Index: " + j + " " +
//"X Pos: " + nodeArray[j].xpos + " " +
//"Y Pos: " + nodeArray[j].ypos + " " +
//"Right Branch: " + nodeArray[j].hasRightBranch + " " +
//"Left Branch: " + nodeArray[j].hasLeftBranch + "\n");