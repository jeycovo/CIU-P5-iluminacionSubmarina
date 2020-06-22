class Objetos{
 PShape forma;
 String tipo;
 float posX;
 float posY;
 float posZ;
 float movX = 0;
 float movY = 0;
 float movZ = 0;
 color colorObjeto;
 boolean cubo = false;
 Objetos(String s, float x, float y, float z){
   this.posX = x;
   this.posY = y;
   this.posZ = z;
   PShape a;
   switch(s){
     case "pezI":
       break;
     case "cubo":
       a = createShape(BOX, 100);
       this.colorObjeto = color(random(255),random(255),random(255));
       a.setFill(this.colorObjeto);
       a.setStroke(0);
       endShape(CLOSE);
       this.forma = a;
       this.cubo = true;
       break;
     case "triangulo":
       break;
     case "suelo":
       a = createShape(BOX, 50000, 1, 50000);
       a.setFill(color(239, 127, 26));
       endShape(CLOSE);
       this.forma = a;
       break;
     case "esfera":
       a = createShape(SPHERE, 100);
       this.colorObjeto = color(random(255),random(255),random(255));
       a.setFill(this.colorObjeto);
       a.setStroke(0);
       endShape(CLOSE);
       this.forma = a;
       break;
   }
 }
 
 void mostrar(){
   push();
   translate(this.posX,this.posY,this.posZ);
   shape(this.forma);
   pop();
 }
 
 void moverse(){
   this.posX += movX;
   this.posY += movY;
   this.posZ += movZ;
 }
  
}
