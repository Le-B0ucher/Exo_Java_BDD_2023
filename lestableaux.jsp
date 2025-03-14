<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les tableaux</h1>

    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite (exemple : 6 78 15) :
        <input type="text" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération de la saisie utilisateur --%>
    <% String chaine = request.getParameter("chaine"); %>

    <% if (chaine != null && !chaine.trim().isEmpty()) { 
        String[] tableauDeChiffres = chaine.trim().split("\\s+");
        int longueurTableau = tableauDeChiffres.length;

        // Vérification qu'il y a au moins 3 nombres
        if (longueurTableau >= 3) { 
            int[] nombres = new int[longueurTableau];
            for (int i = 0; i < longueurTableau; i++) {
                nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
            }
    %>

    <h2>Analyse des valeurs saisies</h2>
    <p>Le tableau contient <%= longueurTableau %> valeurs.</p>
    <ul>
        <% for (int i = 0; i < longueurTableau; i++) { %>
            <li>Valeur <%= (i + 1) %> : <%= nombres[i] %></li>
        <% } %>
    </ul>

    <hr>

    <h2>Exercice 1 : Carré de la première valeur</h2>
    <p>Le carré de la première valeur (<%= nombres[0] %>) est : <%= nombres[0] * nombres[0] %></p>

    <h2>Exercice 2 : Somme des deux premières valeurs</h2>
    <p>La somme de <%= nombres[0] %> et <%= nombres[1] %> est : <%= nombres[0] + nombres[1] %></p>

    <h2>Exercice 3 : Somme de toutes les valeurs</h2>
    <% 
        int sommeTotale = 0;
        for (int num : nombres) { sommeTotale += num; }
    %>
    <p>La somme de toutes les valeurs est : <%= sommeTotale %></p>

    <h2>Exercice 4 : Valeur maximale</h2>
    <% int max = Arrays.stream(nombres).max().getAsInt(); %>
    <p>La valeur maximale est : <%= max %></p>

    <h2>Exercice 5 : Valeur minimale</h2>
    <% int min = Arrays.stream(nombres).min().getAsInt(); %>
    <p>La valeur minimale est : <%= min %></p>

    <h2>Exercice 6 : Valeur la plus proche de 0</h2>
    <% 
        int procheZero = nombres[0];
        for (int num : nombres) {
            if (Math.abs(num) < Math.abs(procheZero)) {
                procheZero = num;
            }
        }
    %>
    <p>La valeur la plus proche de 0 est : <%= procheZero %></p>

    <h2>Exercice 7 : Valeur la plus proche de 0 (priorité au positif)</h2>
    <% 
        int procheZeroV2 = nombres[0];
        for (int num : nombres) {
            if (Math.abs(num) < Math.abs(procheZeroV2) || 
                (Math.abs(num) == Math.abs(procheZeroV2) && num > procheZeroV2)) {
                procheZeroV2 = num;
            }
        }
    %>
    <p>La valeur la plus proche de 0 (en priorisant le positif) est : <%= procheZeroV2 %></p>

    <% } else { %>
        <p style="color:red;">Veuillez entrer au moins 3 nombres séparés par des espaces.</p>
    <% } %>

    <% } %>

    <hr>
    <p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
