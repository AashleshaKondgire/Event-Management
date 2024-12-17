<%@ page import="java.util.List"%>
<%@ page import="com.project5.model.User"%>
<%@ page import="com.project5.model.Event"%>

<html>
<head>
    <title>Attendee Form</title>
    <style>
        /* Basic page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5; /* Light purple background */
            color: #4a235a; /* Dark purple for text */
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4a235a; /* Dark purple for heading */
            margin-bottom: 20px;
        }

        /* Form container styling */
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff; /* White background for the form */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #8e44ad; /* Medium purple for the submit button */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #7d3c98; /* Darker purple on hover */
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer a {
            color: #8e44ad; /* Medium purple for the back link */
            text-decoration: none;
            transition: color 0.3s;
        }

        .form-footer a:hover {
            color: #7d3c98; /* Darker purple on hover */
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
            <!-- Hidden ID input for attendee -->
            <input type="hidden" name="id" value="<%= (attendee != null && attendee.getId() != null) ? attendee.getId() : "" %>">

            <label>Name:</label>
            <input type="text" name="username" value="<%= (attendee != null) ? attendee.getUsername() : "" %>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<%= (attendee != null) ? attendee.getEmail() : "" %>" required>

            <label>Event:</label>
            <select name="eventId" required>
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
