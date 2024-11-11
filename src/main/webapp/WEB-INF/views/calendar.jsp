<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Events</title>
    <style>
        /* Basic body styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a8d0e6, #f4f6f9);
            color: #333;
            margin: 0;
            padding-top: 80px; /* Space for navbar */
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* Navbar styling */
        .navbar {
            width: 100%;
            background-color: #1f78b4;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 1.1em;
            font-weight: bold;
            background-color: #4caf50;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #388e3c;
        }

        /* Page title */
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 2em;
        }

        /* Table styling */
        table {
            width: 80%;
            max-width: 1000px;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 1em;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #1f78b4;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* No events message styling */
        .no-events {
            text-align: center;
            padding: 20px;
            color: #888;
            font-size: 1.1em;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="${pageContext.request.contextPath}/events">Back to Main Menu</a>
    </div>

    <!-- Page Title -->
    <h1>Upcoming Events in the Next 5 Days</h1>
    
    <!-- Events Table -->
    <table>
        <tr>
            <th>Event Name</th>
            <th>Date</th>
            <th>Venue</th>
        </tr>
        
        <%
            List<Event> upcomingEvents = (List<Event>) request.getAttribute("upcomingEvents");
            if (upcomingEvents != null && !upcomingEvents.isEmpty()) {
                for (Event event : upcomingEvents) {
        %>
                    <tr>
                        <td><%= event.getName() %></td>
                        <td><%= event.getDate() %></td>
                        <td><%= event.getVenue().getName() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="3" class="no-events">No upcoming events within the next 5 days.</td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
