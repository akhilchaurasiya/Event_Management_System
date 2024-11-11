<%@ page import="java.util.List"%>
<%@ page import="com.project5.model.User"%>
<%@ page import="com.project5.model.Event"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendee Form</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a8d0e6, #f4f6f9);
            color: #333;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form Container Styling */
        .form-container {
            max-width: 600px;
            width: 100%;
            padding: 30px 40px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
            font-size: 1em;
        }

        input[type="text"]:focus, input[type="email"]:focus, select:focus {
            border-color: #1f78b4;
            outline: none;
        }

        /* Submit Button Styling */
        input[type="submit"] {
            background-color: #1f78b4;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #5aa0d6;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer a {
            color: #1f78b4;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .form-footer a:hover {
            color: #5aa0d6;
        }

        /* Responsive Layout */
        @media (max-width: 480px) {
            .form-container {
                padding: 20px 25px;
            }

            h1 {
                font-size: 1.5em;
            }

            input[type="submit"] {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>
            <% User attendee = (User) request.getAttribute("attendee"); %>
            <%= (attendee != null && attendee.getId() != null) ? "Edit" : "Create" %> Attendee
        </h1>

        <form action="<%= request.getContextPath() %>/attendees" method="post">
            <input type="hidden" name="id" value="<%= (attendee != null && attendee.getId() != null) ? attendee.getId() : "" %>">

            <label for="username">Name:</label>
            <input type="text" id="username" name="username" value="<%= (attendee != null) ? attendee.getUsername() : "" %>" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= (attendee != null) ? attendee.getEmail() : "" %>" required>

            <label for="event">Event:</label>
            <select id="event" name="eventId" required>
                <% 
                    List<Event> events = (List<Event>) request.getAttribute("events");
                    if (events != null) {
                        for (Event event : events) {
                            String selected = (attendee != null && attendee.getEvents().contains(event)) ? "selected" : "";
                %>
                <option value="<%= event.getId() %>" <%= selected %>>
                    <%= event.getName() %> - <%= event.getDate() %>
                </option>
                <% 
                        }
                    } 
                %>
            </select>

            <input type="submit" value="Save">
        </form>
        <div class="form-footer">
            <a href="${pageContext.request.contextPath}/attendees">Back to Attendees List</a>
        </div>
    </div>
</body>
</html>
