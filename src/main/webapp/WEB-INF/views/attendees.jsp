<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project5.model.User" %>
<%@ page import="com.project5.model.Event" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendees List</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a8d0e6, #f4f6f9);
            color: #333;
            margin: 0;
            padding-top: 80px; /* Space for navbar */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navbar Styling */
        .navbar {
            width: 100%;
            background-color: #1f78b4;
            padding: 15px;
            position: fixed;
            top: 0;
            display: flex;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 1.1em;
            font-weight: bold;
            background-color: #5aa0d6;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #388e3c;
        }

        /* Page Title */
        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 90%;
            max-width: 1000px;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 1em;
        }

        th {
            background-color: #1f78b4;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Action Links */
        .action-link {
    display: inline-block;
    padding: 8px 12px;
    border-radius: 5px;
    color: #ffffff;
    font-weight: bold;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

/* Edit Button */
.action-link.edit {
    background-color: #007bff; /* Blue color for Edit */
}

.action-link.edit:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

/* Delete Button */
.action-link.delete {
    background-color: #dc3545; /* Red color for Delete */
}

.action-link.delete:hover {
    background-color: #c82333; /* Darker red on hover */
}
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/attendees/new">Add New Attendee</a>
    </div>

    <!-- Page Content -->
    <h1>Attendees</h1>
    <table>
        <tr>
            <th>Attendee Name</th>
            <th>Email</th>
            <th>Participating Events</th>
            <th>Actions</th>
        </tr>
        <%
            List<User> attendees = (List<User>) request.getAttribute("attendees");
            for (User attendee : attendees) {
                List<Event> events = new ArrayList<>(attendee.getEvents());
        %>
            <tr>
                <td><%= attendee.getUsername() %></td>
                <td><%= attendee.getEmail() %></td>
                <td>
                    <%
                        if (events.isEmpty()) {
                            out.print("No Events");
                        } else {
                            for (Event event : events) {
                                out.print(event.getName() + " (" + event.getDate() + ")<br/>");
                            }
                        }
                    %>
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/attendees/edit/<%= attendee.getId() %>" class="action-link edit">Edit</a>
                    <a href="<%= request.getContextPath() %>/attendees/delete/<%= attendee.getId() %>" class="action-link delete">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
