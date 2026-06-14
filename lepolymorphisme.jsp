<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor=white>
<h1>Exercices sur le polymorphisme</h1>
<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien"></p>
    <p>Saisir le nom d'un chat : <input type="text" name="chat"></p>
    <p><input type="submit" value="Faire crier les animaux"></p>
</form>

<%-- ========================================== --%>
<%--          DÉCLARATION DES CLASSES          --%>
<%-- ========================================== --%>
<%!
    // Exercice 3 : Interface Affichable
    interface Affichable {
        String afficher(); 
    }

    // Une classe mère Animal
    class Animal {
        String nom;
        public Animal(String nom) { this.nom = nom; }
        public String crier() { return "..."; }
        
        // Exercice 1 : Redéfinition de toString()
        @Override
        public String toString() {
            return "Animal nommé " + nom;
        }
    }

    // Deux classes filles
    class Chien extends Animal implements Affichable {
        public Chien(String nom) { super(nom); }
        public String crier() { return "Wouf wouf !"; }
        
        @Override
        public String toString() {
            return "Chien nommé " + nom;
        }

        public String afficher() {
            return "[Affichage] Je suis un chien, mon nom est " + nom;
        }
    }

    class Chat extends Animal implements Affichable {
        public Chat(String nom) { super(nom); }
        public String crier() { return "Miaou !"; }
        
        @Override
        public String toString() {
            return "Chat nommé " + nom;
        }

        public String afficher() {
            return "[Affichage] Je suis un chat, mon nom est " + nom;
        }
    }

    // Exercice 4 : Nouvelle classe fille Oiseau
    class Oiseau extends Animal {
        public Oiseau(String nom) { super(nom); }
        @Override
        public String crier() { return "Cui cui !"; }
        
        @Override
        public String toString() {
            return "Oiseau nommé " + nom;
        }
    }

    // Exercice 2 : Classe abstraite Forme
    abstract class Forme {
        public abstract double aire();
    }

    class Cercle extends Forme {
        double rayon;
        public Cercle(double rayon) { this.rayon = rayon; }
        @Override
        public double aire() {
            return Math.PI * rayon * rayon;
        }
    }

    class Carre extends Forme {
        double cote;
        public Carre(double cote) { this.cote = cote; }
        @Override
        public double aire() {
            return cote * cote;
        }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% 
    String chien = request.getParameter("chien"); 
    String chat = request.getParameter("chat"); 
%>

<% if (chien != null && chat != null && !chien.isEmpty() && !chat.isEmpty()) { %>

    <%-- Tableau d'Animal (Exercice 4 inclus) --%>
    <% Animal[] animaux = { new Chien(chien), new Chat(chat), new Oiseau("PiouPiou") }; %>

    <p>Démonstration du polymorphisme :</br>
    Le tableau est déclaré <code>Animal[]</code>, mais c'est bien la méthode <code>crier()</code> de la sous-classe qui est appelée à l'exécution.</p>

    <% for (Animal a : animaux) { %>
        <p><%= a.nom %> dit : <%= a.crier() %></p>
        <p><i>Résultat toString() : <%= a.toString() %></i></p>
        
        <p>Type détecté : 
        <% if (a instanceof Chien) { %>
            <b>C'est un chien</b>
        <% } else if (a instanceof Chat) { %>
            <b>C'est un chat</b>
        <% } else { %>
            <b>Autre animal</b>
        <% } %>
        </p>
        <hr/>
    <% } %>

    <h2>Exercice 1 : Redéfinir toString()</h2>
    <p>Le résultat est visible directement dans la boucle ci-dessus sous chaque animal.</p>

    <h2>Exercice 2 : La classe abstraite Forme</h2>
    <%
        Forme[] formes = { new Cercle(3.0), new Carre(4.0) };
    %>
    <ul>
        <% for(Forme f : formes) { %>
            <li>Aire de la forme : <%= String.format("%.2f", f.aire()) %></li>
        <% } // <-- L'OUBLI ÉTAIT ICI, CETTE BOUCLE EST MAINTENANT BIEN FERMÉE %>
    </ul>

    <h2>Exercice 3 : L'interface Affichable</h2>
    <%
        Affichable[] elementsAffichables = { new Chien(chien), new Chat(chat) };
    %>
    <ul>
        <% for(Affichable element : elementsAffichables) { %>
            <li><%= element.afficher() %></li>
        <% } %>
    </ul>

    <h2>Exercice 4 : Ajouter un Oiseau</h2>
    <p>L'oiseau "PiouPiou" a été ajouté au tableau principal sans modifier sa boucle d'affichage.</p>

    <h2>Exercice 5 : L'opérateur instanceof</h2>
    <p>L'analyse dynamique avec <code>instanceof</code> est fonctionnelle dans la boucle principale.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
