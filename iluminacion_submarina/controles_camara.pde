
void keyPressed(){
    switch (keyCode){
      case UP:
        caseUp = true;
        break;
      case DOWN:
        caseDown = true;
        break;
      case LEFT:
        caseLeft = true;
        break;
      case RIGHT:
        caseRight = true;
        break;
    }
    
    switch (key){
      case 'W':
      case 'w':
        caseW = true;
        break;
      case 'S':
      case 's':
        caseS = true;
        break;
      case 'A':
      case 'a':
        caseA = true;
        break;
      case 'D':
      case 'd':
        caseD = true;
        break;
      case 'X':
      case 'x':
        vista = (vista + 1)%3;
        if(vista == 2){ 
        }else if ( vista == 0){
        }
        break;
    }
}

void keyReleased(){
  switch (keyCode){
      case UP:
        caseUp = false;
        break;
      case DOWN:
        caseDown = false;
        break;
      case LEFT:
        caseLeft = false;
        break;
      case RIGHT:
        caseRight = false;
        break;
    }
    switch (key){
      case 'W':
      case 'w':
        caseW = false;
        break;
      case 'S':
      case 's':
        caseS = false;
        break;
      case 'A':
      case 'a':
        caseA = false;
        break;
      case 'D':
      case 'd':
        caseD = false;
        break;
    }
}
