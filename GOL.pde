class GOL {    //Game Of Life 

  int w = 8;    //grid size
  int columns, rows;

  // 2d array - game of life grid
  int[][] board;


  GOL() {
 // Initialize rows, columns and set-up arrays
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];
    
    // Call function(init) to fill the grid
    init();
  }
  
//assuming each live cell as 1 and no cell 0
  
//this function fills the grid with 0 and 1
  void init() {
    for (int i =1;i < columns-1;i++) {  //filling the grid taking 1 column from each side out
      for (int j =1;j < rows-1;j++) {   //filling the grid taking 1 row from each side out
        if (j%2==0) board[i][j] = 1;    //filling the grid with horizontal 1's 
        else                               //filling it horizontally to give the initial state as the scenario 6
        board[i][j] = 0;  //and 0's
      }
    }
  }

  // The new generation
  void generate() {
    int[][] next = new int[columns][rows];

    // following 2 For Loops go through every spot in our 2D array 
    //and check neighbors
    
    //to go through every cell in the grid
    for (int x = 1; x < columns-1; x++) {    //going through columns
      for (int y = 1; y < rows-1; y++) {    //going through rows

        // Add up all the 3x3 surrounding grid(neighbours)
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {    //neighbours in columns
          for (int j = -1; j <= 1; j++) {  //neighbours in rows
            neighbors += board[x+i][y+j];
          }
        }

        // Subtracting the current cell's state since
        // we added it in the above loop
        neighbors -= board[x][y];

        // Rules of Game
        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Underpopulation
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overcrowding
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Creation of life
        else if ((board[x][y] == 1) && ( (neighbors == 3) || (neighbors == 2) ) ) next[x][y] = 1;      //Survival   
        else                                            next[x][y] = board[x][y];  // No interactions
      }
    }

    // Next is now our board
    board = next;
  }

  // Draw the live cells, fill 255 for '1', fill 0 for '0'
  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        if ((board[i][j] == 1)) fill(0);    //all the squares with 1 be filled with black
        else fill(255);                 //all the squares with 0 be filled with white
        stroke(0);
        rect(i*w, j*w, w, w);        //square
      }
    }
  }
}
