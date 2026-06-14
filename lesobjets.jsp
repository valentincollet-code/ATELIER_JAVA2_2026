<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les objets</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les objets</h1>
<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom"></p>
    <p>Saisir un âge : <input type="text" name="age"></p>
    <p><input type="submit" value="Créer la personne"></p>
</form>

<%-- ========================================== --%>
<%--          DÉCLARATION DES CLASSES          --%>
<%-- ========================================== --%>
<%!
    // Exercice 5 (et 2) : Modification de la classe Personne
    class Personne {
        // Exercice 5 : Attributs passés en private
        private String nom;
        private int age;

        // Exercice 2 : Méthode seDecrire()
        public String seDecrire() {
            return "Je m'appelle " + this.nom + " et j'ai " + this.age + " ans.";
        }

        // Exercice 5 : Getters et Setters
        public String getNom() { return nom; }
        public void setNom(String nom) { this.nom = nom; }

        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }
    }

    // Exercice 1 : Classe Voiture
    class Voiture {
        String marque;
        String modele;
        int annee;
    }

    // Exercice 3 : Classe Rectangle
    class Rectangle {
        double longueur;
        double largeur;

        public double calculerSurface() {
            return longueur * largeur;
        }
    }

    // Exercice 4 : Classe CompteBancaire
    class CompteBancaire {
        double solde;

        public void deposer(double montant) {
            solde += montant; // ou solde = solde + montant;
        }

        public void retirer(double montant) {
            solde -= montant; // ou solde = solde - montant;
        }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% 
    String nom = request.getParameter("nom"); 
    String age = request.getParameter("age"); 
%>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <%-- ========================================== --%>
    <%--            EXÉCUTION DU CODE               --%>
    <%-- ========================================== --%>

    <%-- Instanciation d'un objet Personne avec encapsulation (Exercice 5) --%>
    <% 
        Personne p = new Personne(); 
        p.setNom(nom); // Utilisation du setter (Exercice 5)
        p.setAge(Integer.parseInt(age)); // Utilisation du setter (Exercice 5)
    %>

    <p>Objet Personne créé !</p>
    <p>Nom : <%= p.getNom() %></p> <p>Age : <%= p.getAge() %> ans</p> <h2>Exercice 1 : La classe Voiture</h2>
    <%
        // Instanciation
        Voiture maVoiture = new Voiture();
        // Affectation des valeurs
        maVoiture.marque = "Peugeot";
        maVoiture.modele = "208";
        maVoiture.annee = 2022;
    %>
    <p>Marque : <%= maVoiture.marque %>, Modèle : <%= maVoiture.modele %>, Année : <%= maVoiture.annee %></p>

    <h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
    <p><%= p.seDecrire() %></p>

    <h2>Exercice 3 : La classe Rectangle</h2>
    <%
        // Création d'un rectangle de 5 par 3
        Rectangle rect = new Rectangle();
        rect.longueur = 5;
        rect.largeur = 3;
    %>
    <p>La surface du rectangle (5x3) est de : <%= rect.calculerSurface() %></p>

    <h2>Exercice 4 : Le compte bancaire</h2>
    <%
        // Création du compte
        CompteBancaire monCompte = new CompteBancaire();
        monCompte.solde = 0; // Solde initial
        
        // Opérations
        monCompte.deposer(100);
        monCompte.retirer(30);
    %>
    <p>Le solde final du compte après les opérations est de : <%= monCompte.solde %> €</p>

    <h2>Exercice 5 : L'encapsulation</h2>
    <p><i>Note : La modification de la classe Personne avec les attributs privés ainsi que l'adaptation du code avec les getters/setters (getNom, setNom, etc.) ont été intégrées directement au début du code ci-dessus pour éviter les conflits de redéfinition.</i></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
