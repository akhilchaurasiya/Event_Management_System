<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>

<html>
<head>
    <title>Events List</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a8e6ff, #c9e3f5, #d9ecff);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        .navbar {
            width: 100%;
            background-color: #1f78b4;
            display: flex;
            justify-content: center;
            padding: 15px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: fixed;
            top: 0;
            z-index: 10;
        }

        .navbar a {
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            font-size: 1.1em;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #5aa0d6;
        }

        .navbar .active {
            background-color: #5aa0d6;
        }

        /* Page Title */
        h1 {
            color: #333;
            font-size: 2em;
            margin-top: 100px;
            margin-bottom: 20px;
        }

        /* Add Event Button */
        .add-event-button {
            background-color: #1f78b4;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            margin: 20px;
            transition: background-color 0.3s ease;
        }

        .add-event-button:hover {
            background-color: #5aa0d6;
        }

        /* Table Styling */
        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            font-size: 1em;
        }

        th {
            background-color: #1f78b4;
            color: white;
        }

        td {
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f7faff;
        }

        /* Action Buttons */
        .action-link {
            padding: 8px 12px;
            margin: 0 5px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .edit-link {
            background-color: #007bff;
        }

        .edit-link:hover {
            background-color: #0056b3;
        }

        .delete-link {
            background-color: #dc3545;
        }

        .delete-link:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
    	<a href="${pageContext.request.contextPath}/">Home</a>
        <a href="${pageContext.request.contextPath}/events/new" class="active">Add New Event</a>
        <a href="${pageContext.request.contextPath}/events/calendar">Upcoming Events</a>
        
    </div>

    <!-- Page Content -->
    <h1>Events</h1>
<%--     <a href="${pageContext.request.contextPath}/events/new" class="add-event-button">+ Add New Event</a>
    <a href="${pageContext.request.contextPath}/events/calendar" class="add-event-button">Upcoming Events</a> --%>

    <!-- Events Table -->
    <table>
        <tr>
            <th>Event Name</th>
            <th>Date</th>
            <th>Venue</th>
            <th>Actions</th>
        </tr>
        <% 
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null && !events.isEmpty()) {
                for (Event event : events) { 
        %>
        <tr>
            <td><%= event.getName() %></td>
            <td><%= event.getDate() %></td>
            <td><%= event.getVenue().getName() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/events/edit/<%= event.getId() %>" class="action-link edit-link">Edit</a>
                <a href="<%= request.getContextPath() %>/events/delete/<%= event.getId() %>" class="action-link delete-link">Delete</a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="4">No events found.</td>
        </tr>
        <% 
            } 
        %>
    </table>
</body>
</html>
