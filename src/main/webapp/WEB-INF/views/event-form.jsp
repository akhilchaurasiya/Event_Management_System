<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>
<%@ page import="com.project5.model.Venue" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Form</title>
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
            color: #333;
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form Container Styling */
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        /* Label Styling */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
            text-align: left;
        }

        /* Input Field Styling */
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus, select:focus {
            border-color: #4caf50;
            outline: none;
        }

        /* Submit Button Styling */
        input[type="submit"] {
            width: 100%;
            background-color: #1f78b4;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5aa0d6;
        }

        /* Responsive Layout for Smaller Screens */
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
        <h1><%=(request.getAttribute("event") == null || ((Event) request.getAttribute("event")).getId() == null) ? "Create" : "Edit" %> Event</h1>
        <form action="<%=request.getContextPath()%>/events" method="post">
            <% 
                Event event = (Event) request.getAttribute("event");
                if (event != null && event.getId() != null) { 
            %>
            <input type="hidden" name="id" value="<%=event.getId()%>">
            <% } %>

            <label for="name">Event Name:</label>
            <input type="text" id="name" name="name" value="<%=(event != null) ? event.getName() : ""%>" required>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%=(event != null) ? event.getDate() : ""%>" required>

            <label for="venue">Venue:</label>
            <select id="venue" name="venue.id" required>
                <% 
                    List<Venue> venues = (List<Venue>) request.getAttribute("venues");
                    if (venues != null) {
                        for (Venue venue : venues) {
                            String selected = (event != null && event.getVenue() != null && venue.getId().equals(event.getVenue().getId())) ? "selected" : ""; 
                %>
                <option value="<%=venue.getId()%>" <%=selected%>><%=venue.getName()%></option>
                <% 
                        } 
                    } 
                %>
            </select>

            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>
