XML science, entertainment, technology, education, health;
Feed s, ent, t, edu, h; 
boolean showSci = true, showEnt = false, showTec = false, showEdu = false, showHe = false;
int y = 120;
Buttons left, right;
Buttons sci,en,tec,ed,he,general;
int start;
String link;
boolean over = false;
void setup() {
  size(900,750);
  background(255);
  //loads up to date XML files of the feeds
  science = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/science_and_environment/rss.xml");
  entertainment = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/entertainment_and_arts/rss.xml");
  technology = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/technology/rss.xml");
  education = loadXML("http://feeds.bbci.co.uk/news/education/rss.xml?edition=uk");
  health = loadXML("http://feeds.bbci.co.uk/news/video_and_audio/health/rss.xml");
  color red = color(255,13,13);
  color orange = color(255,146,13);
  color green = color(69,167,54);
  color blue = color(42,103,175);
  color purple = color(209,80,196);
  //creates Feed objects for each feed and sets a color
  s = new Feed(science,red);
  ent = new Feed(entertainment,green);
  t = new Feed(technology,orange);
  edu = new Feed(education,blue);
  h = new Feed(health,purple);
  //creates left and right navigation buttons
  left = new Buttons(600,20,20,20,color(155));
  right = new Buttons(640,20,20,20,color(155));
  //creates buttons to navigate between feeds
  sci = new Buttons(20,40,20,20,red);
  en = new Buttons(20,60,20,20,green);
  tec = new Buttons(20,80,20,20,orange);
  ed = new Buttons(20,100,20,20,blue);
  he = new Buttons(20,120,20,20,purple);
}

void draw() {
  background(255);
  left.display();
  left.isOver();
  right.display();
  right.isOver();
  //displays feed buttons and sets booleans for which feed was selected
  sci.display();
  if (sci.isOver() && mousePressed) {
    start = 0;
    showSci = true;
    showEnt = false;
    showTec = false;
    showEdu = false;
    showHe = false;
  }
  en.display();
  if (en.isOver() && mousePressed) {
    start = 0;
    showSci = false;
    showEnt = true;
    showTec = false;
    showEdu = false;
    showHe = false;
  }
  tec.display();
  if (tec.isOver() && mousePressed) {
    start = 0;
    showSci = false;
    showEnt = false;
    showTec = true;
    showEdu = false;
    showHe = false;
  }
  ed.display();
  if (ed.isOver() && mousePressed) {
    start = 0;
    showSci = false;
    showEnt = false;
    showTec = false;
    showEdu = true;
    showHe = false;
  }
  he.display();
  if (he.isOver() && mousePressed) {
    start = 0;
    showSci = false;
    showEnt = false;
    showTec = false;
    showEdu = false;
    showHe = true;
  } 
  //determines which feed to display
  if (showSci) {
    s.display(8,y);
  } 
  if (showEnt) {
    ent.display(8,y);
  } 
  if (showTec) {
    t.display(8,y);
  } 
  if (showEdu) {
    edu.display(8,y);
  } 
  if (showHe) {
    h.display(8,y);
  }
}

void mouseClicked() {
  //opens article in browser when selected
  if (over) {
    link(link);
    over = false;
  } 
  //navigates to the next stories in a feed
  if (right.isOver()) {
    start += 8;
  } 
  //navigates to the previous stories in a feed
  else if (left.isOver()) {
    start -= 8;
      if (start<0) {
        start = 0;
      }
  } 
}
