<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestionnaire de Tâches</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <h2>Ajouter une tâche</h2>

    <form method="post" action="taches.jsp">
        <input type="text" name="titre" placeholder="Titre de la tâche" required />
        <input type="submit" value="Ajouter" />
    </form>

    <%
        // Récupération ou initialisation de la liste
        List<Map<String, Object>> taches = (List<Map<String, Object>>) session.getAttribute("taches");
        if (taches == null) {
            taches = new ArrayList<>();
            session.setAttribute("taches", taches);
        }

        // Traitement du formulaire
        String titre = request.getParameter("titre");
        String descriptionUpdate = request.getParameter("description");
        String descIndex = request.getParameter("descIndex");
        String toggleIndex = request.getParameter("toggleIndex");
        String deleteIndex = request.getParameter("deleteIndex");

        if (titre != null && !titre.trim().isEmpty()) {
            Map<String, Object> tache = new HashMap<>();
            tache.put("titre", titre);
            tache.put("description", "");
            tache.put("terminee", false);
            taches.add(tache);
        }

        if (descriptionUpdate != null && descIndex != null) {
            int i = Integer.parseInt(descIndex);
            taches.get(i).put("description", descriptionUpdate);
        }

        if (toggleIndex != null) {
            int i = Integer.parseInt(toggleIndex);
            boolean current = (Boolean) taches.get(i).get("terminee");
            taches.get(i).put("terminee", !current);
        }

        if (deleteIndex != null) {
            int i = Integer.parseInt(deleteIndex);
            taches.remove(i);
        }
    %>

    <h2>Liste des tâches</h2>

    <%
        for (int i = 0; i < taches.size(); i++) {
            Map<String, Object> t = taches.get(i);
            String tTitre = (String) t.get("titre");
            String tDesc = (String) t.get("description");
            boolean terminee = (Boolean) t.get("terminee");
    %>
        <div class="task">
            <div>
                <div class="task-title"><%= tTitre %></div>

                <form method="post" action="taches.jsp" style="margin-top: 5px;">
                    <input type="hidden" name="descIndex" value="<%= i %>" />
                    <input type="text" name="description" value="<%= tDesc %>" placeholder="Description" />
                    <input type="submit" value="💾" title="Mettre à jour la description" />
                </form>

                <div class="status">
                    Statut : <%= terminee ? "Terminée" : "En cours" %>
                </div>
            </div>

            <div class="actions">
                <form method="post" action="taches.jsp" style="display:inline;">
                    <input type="hidden" name="toggleIndex" value="<%= i %>" />
                    <button type="submit"><%= terminee ? "↩️ En cours" : "✔️ Terminée" %></button>
                </form>

                <form method="post" action="taches.jsp" style="display:inline;">
                    <input type="hidden" name="deleteIndex" value="<%= i %>" />
                    <button type="submit">🗑️ Supprimer</button>
                </form>
            </div>
        </div>
    <%
        }
    %>

    <p><a href="index.html">Retour à l'accueil</a></p>

</body>
</html>
