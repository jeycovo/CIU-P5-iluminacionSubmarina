
//Hashmap creado para almacenar los planetas con su información, el nombre del planeta será la clave
import java.util.Map;
ArrayList <PShape> listaFormas;
//cases
boolean caseUp = false;
boolean caseDown = false;
boolean caseRight = false;
boolean caseLeft = false;
boolean caseW = false;
boolean caseS = false;
boolean caseA = false;
boolean caseD = false;

float mov = 25;

//movidas
PVector i;
PVector j;
PVector k;

PImage bg;
PShape nave;
int vista = 0;
int indiceCuerpos = 0;

//Textos a mostrar
String t = "W -> subir nave  \nS -> bajar nave \nA -> Giro nave a la izquierda \nD -> Giro nave a la derecha ";
String t2 ="FlechaArriba\t-> Avanzar la nave \nFlechaAbajo\t-> Retroceder la nave \nFlechaDerecha\t-> Desplazarse a la derecha \nFlechaIzquierda\t-> Desplazarse a la izquierda";
String t3 ="X -> Cambiar de vista";
String t4 ="C -> Cambiar de planeta";
String v0 = "Vista General";
String v1 = "Vista Planeta";
String v2 = "Vista Nave";
PImage suelo, tuna, agua;
ArrayList <Objetos> lObjetos;

void setup(){
  //creamos un nuevo diccionario con los planetas y sus medidas:
  //radio, velocidad de rotacion, velocidad de translación, orbita,
  size(1280,1024,P3D);
  //Imagen de fondo
  bg = loadImage("2k_stars.jpg");
  suelo = loadImage("Assets/suelo2.jpg");
  //Ajustamos texto
  textSize(25);
  
  //Coordenadas camara
  i = new PVector(width/2,height/2+100, 0);
  j = new PVector(0,0,-150);
  k = new PVector(0,1,0);
  
  //Creamos la nave
  crearNave();
  
  PVector camRelativa = PVector.add(i,j);
  //Creamos los objetos del entorno
  lObjetos = new ArrayList <Objetos>();
  Objetos o = new Objetos("suelo", width/2.0, height, 0 );
  lObjetos.add(o);
  for(int i = 1; i<201 ; i++){
    float u = i/3;
    o = new Objetos("esfera", camRelativa.x+random(-100,100)*u, camRelativa.y-random(25, 200)*u, camRelativa.z+500+random(-200, 200)*u);
    lObjetos.add(o);
    o = new Objetos("cubo", camRelativa.x+random(-200,200)*u, camRelativa.y-random(25, 200)*u, camRelativa.z+random(-200, 200)*u); 
    lObjetos.add(o);
  }
} 

void draw(){
//Nos situamos en medio de la pantalla
  bg.resize(width,height);
  background(bg);
  

  //Gestión de Camaras
  PVector camRelativa = PVector.add(i,j);
  //ambientLight(37, 40, 80);
  ambientLight(0, 0, 0);
  //
  spotLight(255, 255, 255, camRelativa.x-50, camRelativa.y, camRelativa.z, i.x, i.y, i.z, PI/2.0 , 800);
  lightFalloff(2.0, 0.004, 0.0);
  pointLight(255, 255, 0, camRelativa.x, camRelativa.y, camRelativa.z);
  camera(i.x, i.y, i.z, camRelativa.x, camRelativa.y, camRelativa.z, k.x, k.y, k.z);
  //dibujo de la nave
  pushMatrix();
  translate(camRelativa.x, camRelativa.y+50, camRelativa.z);
  shape(nave);
  popMatrix();
  

  //Creación de objetos
  for (Objetos o : lObjetos){
    //o.moverse();
    o.mostrar();
  }
  
  //Movimiento camara
  //Solo lo llamamos si ha habido algúna modificación del movimiento
  if(caseUp || caseDown || caseRight || caseLeft || caseA || caseW || caseD || caseS){
    camaraController(i, j, k);
  }
} //<>// //<>//


void crearNave(){
  int h = 20;
  int w = 30;
  int d = 50;
  nave = createShape();
  nave.beginShape(TRIANGLE_STRIP);
  nave.fill(color(255,255,20));
  nave.vertex(-w*0.5, 0, 0);
  nave.vertex( w*0.5, 0, 0);
  nave.vertex( 0    , 0, d);
  nave.vertex(-w*0.5, 0, 0);
  nave.vertex( 0    , h, 0);
  nave.vertex( 0    , 0, d);
  nave.vertex( w*0.5, 0, 0);
  nave.vertex( 0    , h, 0);
  nave.vertex( 0    , 0, d);
  nave.endShape(CLOSE);
  nave.rotateY(radians(180));
}
