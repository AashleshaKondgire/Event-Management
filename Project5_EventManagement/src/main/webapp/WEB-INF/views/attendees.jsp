<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project5.model.User" %>
<%@ page import="com.project5.model.Event" %>

<html>
<head>
    <title>Attendees List</title>
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

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #ffffff; /* White background for table */
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #8e44ad; /* Medium purple for table header */
            color: white;
        }

        tr:hover {
            background-color: #d7bde2; /* Light purple highlight on row hover */
        }

        a {
            text-decoration: none;
            color: #8e44ad; /* Medium purple for links */
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #e0e0e0; /* Background change on hover */
        }

        /* Button styling */
        .add-attendee {
            display: block;
            width: 150px;
            margin: 0 auto;
            padding: 10px;
            background-color: #8e44ad; /* Medium purple for button */
            color: white;
            text-align: center;
            border-radius: 4px;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .add-attendee:hover {
            background-color: #7d3c98; /* Darker purple on hover */
        }
    </style>
</head>
<body>
    <h1>Attendees</h1>
    <a href="${pageContext.request.contextPath}/attendees/new" class="add-attendee">Add New Attendee</a>
    <table>
        <tr>
            <th>Attendee Name</th>
            <th>Email</th>
            <th>Participating Events</th> <!-- New column for events -->
            <th>Actions</th>
        </tr>
        <%
            List<User> attendees = (List<User>) request.getAttribute("attendees");
            for (User attendee : attendees) {
                List<Event> events = new ArrayList<>(attendee.getEvents()); // Get the events for each attendee
        %>
            <tr>
                <td><%= attendee.getUsername() %></td>
                <td><%= attendee.getEmail() %></td>
                <td>
                    <%
                        if (events.isEmpty()) {
                            out.print("No Events"); // Display if no events
                        } else {
                            for (Event event : events) {
                                out.print(event.getName() + " (" + event.getDate() + ")<br/>"); // Display event name and date
                            }
                        }
                    %>
                </td>
                <td>
                    <a href="<%= request.getContextPath() %>/attendees/edit/<%= attendee.getId() %>">Edit</a>
                    <a href="<%= request.getContextPath() %>/attendees/delete/<%= attendee.getId() %>">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
