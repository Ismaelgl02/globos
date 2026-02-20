// 1. Declaramos la variable para la imagen a nivel global
PImage cara; 
ArrayList<Globo> globos;

class Globo {
  float x, y, vx, vy;
  
  Globo (float _x, float _y) {
    x = _x;
    y = _y; 
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
  }

  void update() {
    y += vy;
    x += vx;
  }

  void dibujate() {
      // Opcional: Centrar la imagen para que coincida con la elipse
      imageMode(CENTER); 
      
      ellipse(x, y, 80, 100);
      image(cara, x, y);
      
      // 2. Eliminamos el pop() que estaba huérfano
  }
}

void setup() {
  size(640, 480);
  globos = new ArrayList<Globo>();  
  cara = loadImage("F7EMIBoW0AAosUv.jpg"); // Asegúrate de tener esta imagen en la carpeta 'data'
}

void draw() {
  // Pintamos todo el fondo de color rojo
  background(173, 21, 25); 
  
  // Dibujamos la franja amarilla en el centro
  fill(255, 194, 0); // Color amarillo
  noStroke();        // Quitamos los bordes al rectángulo
  rect(0, height/4, width, height/2); // (x, y, ancho, alto)

  // Restauramos el color blanco y el borde negro para los globos
  fill(255); 
  stroke(0);

  // Dibujamos los globos
  for (int i = 0; i < globos.size(); i++) {
    globos.get(i).update();
    globos.get(i).dibujate();
  }
}

void mousePressed() {
  globos.add(new Globo(mouseX, mouseY));
}
