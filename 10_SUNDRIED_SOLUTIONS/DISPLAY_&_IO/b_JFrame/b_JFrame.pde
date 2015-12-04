/*
 * JFrame
 * Uses JFrame to create a new window with text 
 *
 * MW 3.11.15
 * https://docs.oracle.com/javase/7/docs/api/javax/swing/JFrame.html
 *
 * end
 
 */


import javax.swing.*;
import java.awt.*;
PGraphics pg;

void setup() {
  size(500, 500, P2D);
  pg = createGraphics(80, 80, P2D);
  pg.beginDraw();
  pg.smooth();
  pg.endDraw();



  //1. Create the frame.
  JFrame frame = new JFrame("FrameDemo");
  JTextArea texte = new JTextArea("HELLO", 20, 30 ); 
  JScrollPane sbrText = new JScrollPane(texte); 
  setSize(500, 500);

  //2. Optional: What happens when the frame closes?
  //frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

  //3. Create components and put them in the frame.
  //...create emptyLabel...
  //frame.getContentPane().add(emptyLabel, BorderLayout.CENTER);

  frame.add(sbrText);
  //  frame.add(pg);
  //4. Size the frame.
  frame.pack();
  this.ellipse(20, 20, 10, 10);
  ellipse(20, 20, 100, 100);
  //5. Show it.
  frame.setVisible(true);
}

