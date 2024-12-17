<%@ page import="com.project5.model.Venue" %>

<html>
<head>
    <title>Venue Form</title>
    <style>
        /* Basic page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5; /* Light purple background */
            color: #4a235a; /* Dark purple for text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4a235a; /* Dark purple for heading */
            margin-bottom: 20px;
        }

        /* Form container */
        .form-container {
            background-color: #ffffff; /* White background for form */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
        }

        /* Input fields */
        label {
            margin-bottom: 5px;
            display: block;
            font-weight: bold;
            color: #4a235a; /* Dark purple for labels */
        }

        input[type="text"], input[type="submit"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #8e44ad; /* Medium purple on focus */
            outline: none;
        }

        input[type="submit"] {
            background-color: #8e44ad; /* Medium purple for button */
            color: #ffffff;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #7d3c98; /* Darker purple on hover */
        }

        /* Responsive layout for smaller screens */
        @media (max-width: 480px) {
            .form-container {
                width: 90%;
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
