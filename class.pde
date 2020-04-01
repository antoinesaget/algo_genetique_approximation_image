class POLYGON {
	int[] x = new int[5];
	int[] y = new int[5];
	int grey, alpha, nombre_face;
	color c;

	// Créer un POLYGON aléatoire
	POLYGON () {
		
		float r = random(100);
		// Nombre de faces aléatoire
		for (int i = 3; i <= 5; i++) {
			if (r < nombre_de_face_pourcentage[i]) nombre_face = i;
		}

		// Coordonnées aléatoire
		for (int i = 0; i < nombre_face; i++) {
			x[i] = int(random(objectif.width));
			y[i] = int(random(objectif.height));
		}

		grey  = int(random(255)); // Couleur aléatoire
		alpha = int(random(255)); // Transparence aléatoire
		c = color(grey, grey, grey, alpha);
	}

	// Copy constructor (permet de créer une copie indépendante d'un POLYGON reçu en paramètre)
	POLYGON (POLYGON to_copy) {
		nombre_face = to_copy.nombre_face;

		for (int i = 0; i < nombre_face; i++) {
			x[i] = to_copy.x[i];
			y[i] = to_copy.y[i];
		}

		grey 	= to_copy.grey;
		alpha 	= to_copy.alpha;
		c = color(grey, grey, grey, alpha);
	}

	// Affiche le POLYGON
	void Display () {
		fill(c); // Remplissage
		noStroke(); // Sans bord
		beginShape();
		for (int i = 0; i < nombre_face; i++) {
			vertex(x[i], y[i]);
		}
		endShape(CLOSE);
	}

	// Mutations des coordonnées du POLYGON
	void mutatecoord () {
		for (int i = 0; i < nombre_face; i++) {
			x[i] = x[i] + int(random(-10, 10));
			y[i] = y[i] + int(random(-10, 10));
		}
	}

	// Mutations de la couleur du POLYGON
	void mutatecolor () {
		grey  = int(map(random(-10, 10) +  grey, -10, 265, 0, 255));
		alpha = int(map(random(-10, 10) + alpha, -10, 265, 0, 255));
		c = color(grey, grey, grey, alpha);
	}
}