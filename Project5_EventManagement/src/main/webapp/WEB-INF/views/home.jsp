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
            background: linear-gradient(135deg, #9d50bb, #6e48aa); /* Purple gradient */
            color: #FFFFFF;
        }

        /* Container for buttons */
        .container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5); /* Dark semi-transparent background */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* Page Title */
        .container h1 {
            margin-bottom: 20px;
            font-size: 2em;
            color: #FFFFFF; /* White title */
        }

        /* Button Styles */
        .button {
            display: block;
            width: 200px;
            margin: 10px auto;
            padding: 15px;
            font-size: 18px;
            color: #6e48aa; /* Purple text color */
            background-color: #FFFFFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            text-decoration: none;
            text-align: center;
        }

        .button:hover {
            background-color: #d3c4e3; /* Light purple hover effect */
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Event Management</h1>

        <a href="/events" class="button">Events</a>
        <a href="/venues" class="button">Venues</a>
        <a href="/attendees" class="button">Attendees</a>
    </div>
</body>
</html>
