<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upcoming Events</title>
    <style>
        /* Basic body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #4b0082; /* Dark purple background */
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #e6e6fa; /* Light purple container */
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #6a5acd; /* Slightly darker shade for table header */
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* No events message styling */
        .no-events {
            text-align: center;
            padding: 20px;
            color: #888;
        }
    </style>
</head>
<body>
    <h1>Upcoming Events in the Next 5 Days</h1>
    
    <table>
        <tr>
            <th>Event Name</th>
            <th>Date</th>
            <th>Venue</th>
        </tr>
        
        <%
            List<Event> upcomingEvents = (List<Event>) request.getAttribute("upcomingEvents");
            if (upcomingEvents != null && !upcomingEvents.isEmpty()) {
                for (Event event : upcomingEvents) {
        %>
                    <tr>
                        <td><%= event.getName() %></td>
                        <td><%= event.getDate() %></td>
                        <td><%= event.getVenue().getName() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="3" class="no-events">No upcoming events within the next 5 days.</td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
