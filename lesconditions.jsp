<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*" %>

<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les conditions</h1>

    <form action="#" method="post">
        <p>Saisir la valeur 1 : <input type="text" name="valeur1"></p>
        <p>Saisir la valeur 2 : <input type="text" name="valeur2"></p>
        <p><input type="submit" value="Comparer"></p>
    </form>

    <%-- Récupération des valeurs saisies --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <% if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) { 
        int intValeur1 = Integer.parseInt(valeur1);
        int intValeur2 = Integer.parseInt(valeur2);
    %>

    <h2>Résultat de la comparaison :</h2>
    <p>
        <% if (intValeur1 > intValeur2) { %>
            Valeur 1 est supérieure à Valeur 2.
        <% } else if (intValeur1 < intValeur2) { %>
            Valeur 1 est inférieure à Valeur 2.
        <% } else { %>
            Valeur 1 est égale à Valeur 2.
        <% } %>
    </p>

    <% } %>

    <hr>

    <h2>Exercice 1 : Comparaison entre A, B et C</h2>
    <p>Entrez trois valeurs (A, B, C) et vérifiez si C est compris entre A et B.</p>

    <form action="#" method="post">
        <p>A : <input type="text" name="valeurA"></p>
        <p>B : <input type="text" name="valeurB"></p>
        <p>C : <input type="text" name="valeurC"></p>
        <p><input type="submit" value="Vérifier"></p>
    </form>

    <% String valeurA = request.getParameter("valeurA"); %>
    <% String valeurB = request.getParameter("valeurB"); %>
    <% String valeurC = request.getParameter("valeurC"); %>

    <% if (valeurA != null && valeurB != null && valeurC != null &&
           !valeurA.isEmpty() && !valeurB.isEmpty() && !valeurC.isEmpty()) { 
        int intValeurA = Integer.parseInt(valeurA);
        int intValeurB = Integer.parseInt(valeurB);
        int intValeurC = Integer.parseInt(valeurC);
    %>

    <h3>Résultat :</h3>
    <p>
        <% if (intValeurC >= intValeurA && intValeurC <= intValeurB) { %>
            Oui, C est compris entre A et B.
        <% } else { %>
            Non, C n'est pas compris entre A et B.
        <% } %>
    </p>

    <% } %>

    <hr>

    <h2>Exercice 2 : Pair ou Impair ?</h2>
    <p>Entrez un nombre et vérifiez s'il est pair ou impair.</p>

    <form action="#" method="post">
        <p>Nombre : <input type="text" name="valeurNombre"></p>
        <p><input type="submit" value="Vérifier"></p>
    </form>

    <% String valeurNombre = request.getParameter("valeurNombre"); %>

    <% if (valeurNombre != null && !valeurNombre.isEmpty()) { 
        int nombre = Integer.parseInt(valeurNombre);
    %>

    <h3>Résultat :</h3>
    <p>
        <% if (nombre % 2 == 0) { %>
            Le nombre <%= nombre %> est **pair**.
        <% } else { %>
            Le nombre <%= nombre %> est **impair**.
        <% } %>
    </p>

    <% } %>

    <hr>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

