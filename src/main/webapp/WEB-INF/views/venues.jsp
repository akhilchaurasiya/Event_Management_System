<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Venue" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venues List</title>
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
            color: #333;
            text-align: center;
            font-size: 2em;
            margin: 20px 0;
        }

        /* Table Styling */
        table {
            width: 80%;
            max-width: 800px;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 1em;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #1f78b4;
            color: #ffffff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Action Links */
       /* Styling for action buttons */
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


        /* Responsive Layout for Smaller Screens */
        @media (max-width: 480px) {
            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="<%= request.getContextPath() %>/">Home</a>
        <a href="<%= request.getContextPath() %>/venues/new">Add New Venue</a>
    </div>

    <!-- Page Content -->
    <h1>Venues</h1>
    <table>
        <tr>
            <th>Venue Name</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        
        <% 
            List<Venue> venues = (List<Venue>) request.getAttribute("venues");
            if (venues != null) {
                for (Venue venue : venues) { 
        %>
        <tr>
            <td><%= venue.getName() %></td>
            <td><%= venue.getAddress() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/venues/edit/<%= venue.getId() %>" class="action-link edit">Edit</a>
                <a href="<%= request.getContextPath() %>/venues/delete/<%= venue.getId() %>" class="action-link delete">Delete</a>
            </td>
        </tr>
        <% 
                } 
            } else { 
        %>
        <tr>
            <td colspan="3" class="no-venues">No venues available.</td>
        </tr>
        <% 
            } 
        %>
    </table>
</body>
</html>
