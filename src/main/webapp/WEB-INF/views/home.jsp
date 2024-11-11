<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management Home</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #a8d0e6, #f4f6f9);
            background-size: 400% 400%;
            animation: gradientBackground 15s ease infinite;
            color: #333;
        }

        /* Background Animation */
        @keyframes gradientBackground {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Container for buttons and quote */
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.3);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            max-width: 90%;
        }

        /* Page Title */
        .container h1 {
            margin-bottom: 15px;
            font-size: 2.5em;
            color: #333;
            text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Quote */
        .quote {
            font-style: italic;
            margin-bottom: 20px;
            font-size: 1.2em;
            color: #555;
            opacity: 0.9;
        }

        /* Button Styles */
        .button {
            display: block;
            width: 220px;
            margin: 12px auto;
            padding: 15px;
            font-size: 18px;
            color: #1f78b4;
            background-color: #ffffff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            text-align: center;
        }

        .button:hover {
            background-color: #e0e0e0;
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Event Management</h1>
        <p class="quote">"Every great event begins with a single click start your journey today!"</p>

        <a href="/events" class="button">Events</a>
        <a href="/venues" class="button">Venues</a>
        <a href="/attendees" class="button">Attendees</a>
    </div>
</body>
</html>
