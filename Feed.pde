class Feed {
  XML [] sections, items; 
  XML xml;
  color c;
  int x=120;
  int numDis=8;
  int range, leftOver;
  boolean end = false;
  Feed(XML _xml, color _c) {
    this.xml = _xml;
    this.c = _c;
  }
  
  void display(int numDis, int y) {
    fill(c);
    sections = xml.getChildren();
    items = sections[1].getChildren("item");
    textSize(20);
    //retrieves the title of the feed and the last build date
    text(sections[1].getChild("title").getContent(),70,50);
    text(sections[1].getChild("lastBuildDate").getContent(),70,75);
    range = numDis+start;
    if (range>items.length) {
      range = items.length;
    }
    //displays the title of the articles in the selected feed
    for(int i=start;i<range;i++) {
      String Title = items[i].getChild("title").getContent();
      text(Title,x,y);
      //displays the description of the article when the user hovers over it
      if (isOver(Title,x,y)) {
        text("Description:",120,610);
        text(items[i].getChild("description").getContent(),120,620,550,200);
        //opens article in browser when selected
        if (mousePressed) {
          over = true;
          link = items[i].getChild("link").getContent();
        }
      }
      y+=60;
    }
  }

  //determines whether the user is hovering over a title and sets boolean isOver
  boolean isOver(String Title, int x, int y) {
    if (mouseX>120 && mouseX<x+textWidth(Title) && mouseY>y-20 && mouseY<y) {
      return true;
    } else {
      return false;
    }
  }
}
