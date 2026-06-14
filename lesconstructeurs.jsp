<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les constructeurs</h1>
<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre"></p>
    <p>Saisir un auteur : <input type="text" name="auteur"></p>
    <p><input type="submit" value="Créer les livres"></p>
</form>

<%-- ========================================== --%>
<%--          DÉCLARATION DES CLASSES          --%>
<%-- ========================================== --%>
<%!
    // Une classe Livre avec deux constructeurs : par défaut et avec paramètres
    class Livre {
        String titre;
        String auteur;

        // Constructeur par défaut
        public Livre() {
            this.titre = "Titre inconnu";
            this.auteur = "Auteur inconnu";
        }

        // Constructeur avec paramètres
        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }
    }

    // Exercices 1, 2, 3 et 4 : Classe Etudiant fusionnée
    class Etudiant {
        String nom;
        double note; // Utilisation de double pour pouvoir stocker des notes à virgule si besoin

        // Exercice 1 & 3 : Constructeur par défaut chaîné avec this()
        public Etudiant() {
            this("Anonyme", 10.0); // Appelle directement le constructeur à 2 paramètres (Exercice 3)
        }

        // Exercice 2 : Constructeur avec uniquement le nom en paramètre
        public Etudiant(String nom) {
            this.nom = nom;
            this.note = 10.0; // La note vaut 10 par défaut
        }

        // Exercice 2 : Constructeur prenant le nom et la note en paramètres
        public Etudiant(String nom, double note) {
            this.nom = nom;
            this.note = note;
        }

        // Exercice 4 : Constructeur de copie
        public Etudiant(Etudiant autreEtudiant) {
            this.nom = autreEtudiant.nom;   // Recopie du nom
            this.note = autreEtudiant.note; // Recopie de la note
        }
    }

    // Exercice 5 : Classe Produit avec validation du prix
    class Produit {
        double prix;

        public Produit(double prix) {
            if (prix < 0) {
                this.prix = 0; // Refuse un prix négatif et force la valeur à 0
            } else {
                this.prix = prix;
            }
        }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% 
    String titre = request.getParameter("titre"); 
    String auteur = request.getParameter("auteur"); 
%>

<% if (titre != null && auteur != null) { %>

    <%-- Création de deux livres --%>
    <% Livre livreVide = new Livre(); %>
    <% Livre livrePlein = new Livre(titre, auteur); %>

    <p>Livre créé via le constructeur par défaut :</p>
    <p>Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>

    <p>Livre créé via le constructeur avec paramètres :</p>
    <p>Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>


    <%-- ========================================== --%>
    <%--            EXÉCUTION DU CODE               --%>
    <%-- ========================================== --%>

    <h2>Exercice 1 : Le constructeur par défaut</h2>
    <%
        // Instanciation de l'étudiant avec le constructeur par défaut
        Etudiant eDefaut = new Etudiant();
    %>
    <p>Étudiant par défaut -> Nom : <%= eDefaut.nom %>, Note : <%= eDefaut.note %></p>

    <h2>Exercice 2 : La surcharge de constructeurs</h2>
    <%
        // Création des 3 étudiants demandés avec les 3 constructeurs différents
        Etudiant etudiant1 = new Etudiant();                     // Constructeur par défaut
        Etudiant etudiant2 = new Etudiant("Thomas");             // Constructeur (nom)
        Etudiant etudiant3 = new Etudiant("Julie", 16.5);        // Constructeur (nom, note)
    %>
    <p>Étudiant 1 : Nom = <%= etudiant1.nom %>, Note = <%= etudiant1.note %></p>
    <p>Étudiant 2 : Nom = <%= etudiant2.nom %>, Note = <%= etudiant2.note %></p>
    <p>Étudiant 3 : Nom = <%= etudiant3.nom %>, Note = <%= etudiant3.note %></p>

    <h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
    <p><i>Note : Le chaînage a été mis en place directement dans la définition du constructeur par défaut de l'étudiant (voir la section haute du code). Le résultat de l'Exercice 1 prouve qu'il fonctionne correctement en récupérant bien "Anonyme" et 10.0 via l'appel à <code>this()</code>.</i></p>

    <h2>Exercice 4 : Le constructeur de copie</h2>
    <%
        // Exemple d'utilisation fourni par l'énoncé
        Etudiant e1 = new Etudiant("Marie", 15);
        Etudiant e2 = new Etudiant(e1); // Utilisation du constructeur de copie
    %>
    <p>Étudiant original (e1) -> Nom : <%= e1.nom %>, Note : <%= e1.note %></p>
    <p>Étudiant copié (e2) -> Nom : <%= e2.nom %>, Note : <%= e2.note %></p>

    <h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
    <%
        // Test avec un produit créé à -50€
        Produit monProduit = new Produit(-50.0);
    %>
    <p>Prix envoyé au constructeur : -50.0 €</p>
    <p>Prix réel stocké dans l'objet après validation : <b><%= monProduit.prix %> €</b></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
