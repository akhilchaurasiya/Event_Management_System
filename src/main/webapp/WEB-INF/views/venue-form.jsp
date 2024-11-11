<%@ page import="com.project5.model.Venue" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venue Form</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a8d0e6, #f4f6f9);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form Container */
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 30px 40px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Label and Input Fields */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
            text-align: left;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #1f78b4;
            outline: none;
        }

        /* Submit Button Styling */
        input[type="submit"] {
            background-color: #1f78b4;
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5aa0d6;
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
        <h1>${venue.id == null ? 'Create' : 'Edit'} Venue</h1>
        <form action="${pageContext.request.contextPath}/venues" method="post">
            <input type="hidden" name="id" value="${venue.id}">

            <label for="name">Venue Name:</label>
            <input type="text" id="name" name="name" value="${venue.name}" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${venue.address}" required>

            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>
