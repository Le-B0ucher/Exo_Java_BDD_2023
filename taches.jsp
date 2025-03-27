<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Gestionnaire de Tâches</title>
</head>
<body>
    <h2>Ajouter une tâche</h2>

    <form method="post" action="taches.jsp">
        Tâche : <input type="text" name="tache" required />
        <input type="submit" value="Ajouter" />
    </form>

    <%
        // Récupérer ou créer la liste de tâches depuis la session
        List<String> taches = (List<String>) session.getAttribute("taches");
        if (taches == null) {
            taches = new ArrayList<>();
            session.setAttribute("taches", taches);
        }

        // Ajouter la tâche si envoyée
        String nouvelleTache = request.getParameter("tache");
        if (nouvelleTache != null && !nouvelleTache.trim().isEmpty()) {
            taches.add(nouvelleTache);
        }
    %>

    <h2>Liste des tâches</h2>
    <ul>
        <%
            for (String t : taches) {
        %>
            <li><%= t %></li>
        <%
            }
        %>
    </ul>
</body>
</html>
