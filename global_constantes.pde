int score_minimal = 0; // Score minimal obtenable
int gen = 0;      // Compteur de générations
int compteur = 0; // Compteur
int score_parent; // Variables contenant le score de PARENT, permet d'effetué le calcul du score uniquement si il a changé

boolean trigger = true; // Trigger qui détermine si oui ou non PARENT a changé

// Trigger d'optimisation dans le cas ou les changement de l'image ne se traduisent 
// que par l'ajout d'un nouveau polygon (rare--> optimisation inutile)
boolean simpledisplay = false;

// Tableau contenant le pourcentage de chance qu'un POLYGON ai un certain nombre de côtés
float[] nombre_de_face_pourcentage = {0.0,        // 0 côtés
                                      0.0,        // 1 côtés
                                      0.0,        // 2 côtés
                                      50.0,       // 3 côtés
                                      25,         // 4 côtés
                                      12.5};      // 5 côtés

ArrayList<POLYGON> PARENT = new ArrayList<POLYGON>(); // Array list global de POLYGON 

PImage objectif; // Image objectif à reproduire