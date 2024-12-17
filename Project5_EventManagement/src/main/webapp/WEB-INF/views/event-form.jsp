<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>
<%@ page import="com.project5.model.Venue" %>

<html>
<head>
    <title>Event Form</title>
    <style>
        /* General styling for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5; /* Light purple background */
            color: #4a148c; /* Deep purple for text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #4a148c; /* Deep purple */
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form container styling */
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            width: 100%;
        }

        /* Label styling */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #6a1b9a; /* Medium purple */
        }

        /* Input field styling */
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ce93d8; /* Light purple border */
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1em;
        }

        /* Styling for the submit button */
        input[type="submit"] {
            width: 100%;
            background-color: #8e24aa; /* Medium purple button */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #7b1fa2; /* Darker purple on hover */
        }

        /* Responsive layout for smaller screens */
        @media (max-width: 480px) {
            .form-container {
                padding: 15px 20px;
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
