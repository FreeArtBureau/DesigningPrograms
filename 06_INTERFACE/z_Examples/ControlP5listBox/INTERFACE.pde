/*
VOICI NOTRE CODE POUR L'INTERFACE AINSI QUE LES INTERACTIONS

*/
 
//////////////////////////// INITIALISER L'INTERFACE

void INIT_INTERFACE() {
  ControlP5.printPublicMethodsFor(ListBox.class);
  cp5 = new ControlP5(this);

  //****************************************************
  // PREMIÈRE LISTE POUR LA HEADLINE ;–) 
  l = cp5.addListBox("HEADLINE")
    .setPosition(100, 100)
      .setSize(120, 120)
        .setItemHeight(15)
          .setBarHeight(15)
            .setColorBackground(color(40, 128))
              .setColorActive(color(255, 128))
                ;
  // OPTIONS DE STYLES VISUELS
  l.captionLabel().toUpperCase(true);
  l.captionLabel().set("A Listbox");
  l.captionLabel().setColor(0xffff0000);
  l.captionLabel().style().marginTop = 3;
  l.valueLabel().style().marginTop = 3;

  //****************************************************
  // DEUXIÈME LISTE POUR NOTRE PUNK BAND ;–) 
  l2 = cp5.addListBox("BAND1")
    .setPosition(400, 100)
      .setSize(120, 120)
        .setItemHeight(15)
          .setBarHeight(15)
            .setColorBackground(color(#FFAB03))
              .setColorActive(color(255, 128))
                ;
  // OPTIONS DE STYLES VISUELS              
  l2.captionLabel().setColor(#000000);
  l2.captionLabel().toUpperCase(true);



  // RAJOUTER NOS ÉLÉMENTS (FONTES) À NOS LISTES
  for (int i=0;i<numFontes;i++) { // variable numFontes détérmine le nombre d'éléments dans la liste
    ListBoxItem lbi = l.addItem("font "+i, i); // Ajouter première liste
    ListBoxItem lbi2 = l2.addItem("font "+i, i); // Ajouter 2 liste

    lbi.setColorBackground(0xffff0000);
  }

  //****************************************************
  // CURSEURS :
  
  // CURSEUR POUR CHANGER LA TAILLE DE LA FONTE
  Slider changerTaille1 = cp5.addSlider("fonteCorps1").setPosition(100, 50).setRange(1, 200).setValue(fonteCorps1);
  
  // J'AI RAJOUTÉ UN DEUXIÈME CURSEUR POUR LA DEUXIÈME FONTE
  Slider changerTaille2 = cp5.addSlider("fonteCorps2").setPosition(400, 50).setRange(1, 200).setValue(fonteCorps2);

}


/////////////////////////////////////////////////////////////////////// EVENTS

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    println(theEvent.group().value()+" from "+theEvent.group());
  }
  
   //****************************************************
  // VÉRIFIER SI ON REÇOIT UN ÉVÉNEMENT TYPE MOUSEPRESSED SUR LA LISTE
  if (theEvent.isGroup() && theEvent.name().equals("HEADLINE")) {

    // Variable pour changer de fonte 'choix'
    choix = (int)theEvent.group().value();
    println("test "+choix);
  }
  /*
  if (theEvent.isGroup() && theEvent.name().equals("BAND1")) {

    // Variable pour changer de fonte 'choix'
    choix2 = (int)theEvent.group().value();
    println("test "+choix2);
  }
  */
}

