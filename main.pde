void setup () {
	size(200, 200, P2D); 	// 1. Créer une fenêtre 200*200 rendu à l'aide de P2D
	frameRate(1000); 		// 2. Cap du frameRate au maximum possible

	objectif = loadImage("res/1.jpg"); 		// 3. L'image à reproduire sera objectif
	objectif.loadPixels(); 					// 4. On load l'image objectif en mémoire une seule fois
	score_minimal = scoreMinimal(); 		// 5. Calcul du score maximal obtenable en fonction de l'image objectif
	initPARENT(); 							// 6. Initialise l'array de POLYGON PARENT avec un POLYGON aléatoire
}

void draw () {
	// 1. ENFANT = copie indépendante de PARENT---------------------------------------
	ArrayList<POLYGON> ENFANT = new ArrayList<POLYGON>();
	for (int i = 0; i < PARENT.size(); i++) {
		POLYGON temp_poly = new POLYGON(PARENT.get(i));
		ENFANT.add(temp_poly);
	}

	// 2. On modifie ENFANT-----------------------------------------------------------
	mutations(ENFANT);

	// 3. On calcul le score de PARENT et ENFANT--------------------------------------
	int score_enfant = calculScore(ENFANT);
	simpledisplay = false;  
	if (trigger)score_parent = calculScore(PARENT);

	// 4. Si ENFANT est meilleur, alors on remplace PARENT par ENFANT-----------------
	if (score_enfant < score_parent) { 
		PARENT.clear();
		for (int i = 0; i < ENFANT.size(); i++) {
			POLYGON temp_poly = new POLYGON(ENFANT.get(i));
			PARENT.add(temp_poly);
		}
		trigger = true;
	}
	else {
		trigger = false;
	}

	gen ++;
	compteur ++;

	// 5. On affiche PARENT----------------------------------------------------------
	display(PARENT);
	if (compteur >= 1000) { // On sauvegarde une image de temps en temps
		compteur = 0;
		saveFrame("img/test##.png");
	}

	// 6. Debug----------------------------------------------------------------------
	if (trigger) {
		println("gen = " + gen + " | score = " + String.format("%.2f", (100.0 - (calculScore(PARENT)*100.0/score_minimal))) + " | polygon = " + PARENT.size());
	}
	else {
		println("gen = " + gen + " | score = " + String.format("%.2f", (100.0 - (score_parent*100.0/score_minimal))) + " | polygon = " + PARENT.size());	
	}
}