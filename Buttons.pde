class Buttons {
  int x,y;
  int wide,tall;
  color c, _c;
  color newC = color(0);
  Buttons(int _x, int _y, int _wide, int _tall, color _c) {
    this.x = _x;
    this.y = _y;
    this.wide = _wide;
    this.tall = _tall;
    this.c = _c;
    this._c = _c;
  }
  
  void display() {
    fill(c);
    rect(x,y,wide,tall);
  }
  
  //determines if user is hovering over button and sets boolean isOver
  boolean isOver() {
    if (mouseX>x && mouseX<x+wide && mouseY>y && mouseY<y+tall) {
      c = newC;
      return true;
    } else {
      c = _c;
      return false;
    }
  }
}
