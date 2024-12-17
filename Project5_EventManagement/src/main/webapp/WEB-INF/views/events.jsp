<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Event" %>

<html>
<head>
    <title>Events List</title>
    <style>
        /* General styling for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5; /* Light purple background */
            color: #4a235a; /* Dark purple for text */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }
        
        h1 {
            color: #4a235a; /* Dark purple for header */
            font-size: 2em;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Styling for the 'Add New Event' and 'Upcoming Events' buttons */
        .add-event-button {
            background-color: #8e44ad; /* Medium purple */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .add-event-button:hover {
            background-color: #7d3c98; /* Darker purple on hover */
        }

        /* Styling for the table */
        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #6a1b9a; /* Dark purple for header row */
            color: white;
            font-size: 1.1em;
        }

        td {
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f8eafc; /* Very light purple for even rows */
        }

        /* Styling for action links */
        .action-link {
            padding: 8px 12px;
            margin: 0 5px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .edit-link {
            background-color: #8e44ad; /* Medium purple for edit link */
        }

        .edit-link:hover {
            background-color: #7d3c98; /* Darker purple on hover */
        }

        .delete-link {
            background-color: #a93226; /* Red-purple for delete link */
        }

        .delete-link:hover {
            background-color: #922b21; /* Darker red-purple on hover */
        }
    </style>
</head>
<body>
    <h1>Events</h1>
    <a href="${pageContext.request.contextPath}/events/new" class="add-event-button">+ Add New Event</a>
    <a href="${pageContext.request.contextPath}/events/calendar" class="add-event-button">Upcoming Events</a>
    <table>
        <tr>
            <th>Event Name</th>
            <th>Date</th>
            <th>Venue</th>
            <th>Actions</th>
        </tr>
        <% 
            List<Event> events = (List<Event>) request.getAttribute("events");
            if (events != null && !events.isEmpty()) {
                for (Event event : events) { 
        %>
        <tr>
            <td><%= event.getName() %></td>
            <td><%= event.getDate() %></td>
            <td><%= event.getVenue().getName() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/events/edit/<%= event.getId() %>" class="action-link edit-link">Edit</a>
                <a href="<%= request.getContextPath() %>/events/delete/<%= event.getId() %>" class="action-link delete-link">Delete</a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="4">No events found.</td>
        </tr>
        <% 
            } 
        %>
    </table>
</body>
</html>
