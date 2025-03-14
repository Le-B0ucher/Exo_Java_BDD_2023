<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

<html>
<head>
    <title>Les chaînes de caractères</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaînes de caractères</h1>

    <form action="#" method="post">
        <p>Saisir une chaîne (6 caractères minimum) : 
        <input type="text" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération de la chaîne saisie --%>
    <% String chaine = request.getParameter("chaine"); %>

    <% if (chaine != null && chaine.length() >= 6) { %>

    <h2>Analyse de la chaîne</h2>

    <%-- Longueur de la chaîne --%>
    <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères.</p>

    <%-- Extraction du 3e caractère --%>
    <p>Le 3e caractère de votre chaîne est : <%= chaine.charAt(2) %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.length() >= 6 ? chaine.substring(2, 6) : "Trop court"; %>
    <p>Une sous-chaîne de votre texte : <%= sousChaine %></p>

    <%-- Recherche de la lettre "e" --%>
    <% int positionE = chaine.indexOf('e'); %>
    <p>Votre premier "e" est en position : <%= (positionE != -1 ? positionE + 1 : "Aucun 'e' trouvé") %></p>

    <hr>

    <h2>Exercice 1 : Nombre de 'e' dans la chaîne</h2>
    <% 
        int countE = 0;
        for (char c : chaine.toCharArray()) {
            if (c == 'e') countE++;
        }
    %>
    <p>Le nombre de 'e' dans votre chaîne est : <%= countE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <pre>
    <% for (char c : chaine.toCharArray()) { %>
        <%= c %>
    <% } %>
    </pre>

    <h2>Exercice 3 : Retour à la ligne après chaque espace</h2>
    <pre>
    <% 
        String[] mots = chaine.split(" ");
        for (String mot : mots) { %>
        <%= mot %>
    <% } %>
    </pre>

    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <p>
    <% 
        for (int i = 0; i < chaine.length(); i += 2) { %>
        <%= chaine.charAt(i) %>
    <% } %>
    </p>

    <h2>Exercice 5 : La phrase en verlant</h2>
    <% StringBuilder sb = new StringBuilder(chaine); %>
    <p><%= sb.reverse().toString() %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <% 
        int voyelles = 0, consonnes = 0;
        String voyellesStr = "aeiouyAEIOUY";
        for (char c : chaine.toCharArray()) {
            if (Character.isLetter(c)) {
                if (voyellesStr.indexOf(c) != -1) voyelles++;
                else consonnes++;
            }
        }
    %>
    <p>Voyelles : <%= voyelles %>, Consonnes : <%= consonnes %></p>

    <% } else if (chaine != null) { %>
    <p style="color:red;">Veuillez entrer une chaîne d'au moins 6 caractères.</p>
    <% } %>

    <hr>
    <p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>

