<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
    public String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        String first = input.substring(0, 1).toUpperCase();
        String rest  = input.substring(1);
        return first + rest;
    }
%>
<%
    String bonjour = "salut la compagnie";
    String enMajuscule = bonjour.toUpperCase();
    String capitalized = capitalizeFirstLetter(bonjour);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exercice Chaine</title>
</head>
<body>
    <h1>Résultats de traitement de la chaîne</h1>
    <p><strong>Original :</strong> <%= bonjour %></p>
    <p><strong>Tout en MAJUSCULES :</strong> <%= enMajuscule %></p>
    <p><strong>Seulement la 1<sup>ère</sup> lettre en majuscule :</strong> <%= capitalized %></p>
</body>
</html>
