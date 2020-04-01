// Affiche l'array de POLYGON reçue en paramètres 200*200 --> 40 000 pixels
void display (ArrayList<POLYGON> IMG) {
	background(255);
	for (int i = 0; i < IMG.size(); i++) {
		IMG.get(i).Display();
	}
}

// Affiche le dernier POLYGON de l'array de POLYGON reçue en paramètres 200*200 --> 40 000 pixels
void displaysimple (ArrayList<POLYGON> ARRAY) {
	ARRAY.get(ARRAY.size() - 1).Display();
}

// Calcul le score associé à l'array de POLYGON donné en paramètres par rapport à l'image objectif
int calculScore (ArrayList<POLYGON> ARRAY) {
	if (!simpledisplay) {
		display(ARRAY);
	}
	else {
		displaysimple(ARRAY);
	}
	
	int score = 0; 
  	loadPixels();
	for(int y = 0; y < objectif.height; y++) {
		for(int x = 0; x < objectif.width; x++) {
			int pos = y * objectif.width + x;

			// Comparaison de la couleur de chaque pixel
			int delta_grey = abs(int(pixels[pos] & 0xFF) - int(objectif.pixels[pos] & 0xFF));
			// Ajout au score total
			score += delta_grey;
		}
	}
	return score; // Plus le score est petit plus l'image se rapproche de l'image objectif
}

// Mute l'array list donnée en paramètre
void mutations (ArrayList<POLYGON> ENFANT) {
	// Rajoute parfois un nouveau POLYGON
	if (random(100) < 10) {
		POLYGON temp_polygon = new POLYGON();
		ENFANT.add(temp_polygon);
		simpledisplay = true;
	}

	// Mute les coordonnées de certains POLYGON
	for(int i = 0; i < random(ENFANT.size()); i++) {
		if (random(100) < 10) {
			ENFANT.get(int(random(ENFANT.size()))).mutatecoord();
			simpledisplay = false;
		}
	}

	// Mute la couleur de certains POLYGON
	for(int i = 0; i < random(ENFANT.size()); i++) {
		if (random(100) < 10) {
			ENFANT.get(int(random(ENFANT.size()))).mutatecolor();
			simpledisplay = false;
		}
	}
}

//------------------------------------------------------------------

// Calcul le score minimum possible en fonction de l'image objectif
int scoreMinimal () {
	int score = 0;
	for(int y = 0; y < objectif.height; y++) {
		for(int x = 0; x < objectif.width; x++) {
			int pos = y * width + x;
			// Pour chaque pixel, le score maximum correspond à l'écart maximum entre la couleur du pixel et 0 ou 255
			int grey = int(red(objectif.pixels[pos]));
			score += max(grey, 255 - grey); 
		}
	}
	return score; // normalement = 255*200*200 pour une image noir ou blanche (en effet sa marche !)
}

// Initialise PARENT avec un POLYGON aléatoire
void initPARENT () {
	POLYGON local_POLYGON = new POLYGON();
	PARENT.add(local_POLYGON);
}