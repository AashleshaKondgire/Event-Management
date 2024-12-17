<%@ page import="java.util.List" %>
<%@ page import="com.project5.model.Venue" %>

<html>
<head>
    <title>Venues List</title>
    <style>
        /* Basic page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3e5f5; /* Light purple background */
            color: #4a235a; /* Dark purple for text */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4a235a; /* Dark purple */
            margin-bottom: 20px;
        }

        /* Link for adding a new venue */
        .add-link {
            display: inline-block;
            text-decoration: none;
            background-color: #8e44ad; /* Medium purple */
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            transition: background-color 0.3s ease;
        }

        .add-link:hover {
            background-color: #7d3c98; /* Darker purple */
        }

        /* Styling for the table */
        table {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff; /* White background for table */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #8e44ad; /* Medium purple for table headers */
            color: #ffffff;
        }

        tr:hover {
            background-color: #f1e6f8; /* Light lavender on hover */
        }

        /* Styling for action buttons */
        .action-link {
            text-decoration: none;
            color: #6a1b9a; /* Darker purple for action links */
            margin: 0 5px;
            transition: color 0.3s ease;
        }

        .action-link:hover {
            color: #4a235a; /* Even darker purple on hover */
        }

        /* Responsive layout for smaller screens */
        @media (max-width: 480px) {
            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div>
        <h1>Venues</h1>
        <a href="<%= request.getContextPath() %>/venues/new" class="add-link">Add New Venue</a>
        <table>
            <tr>
                <th>Venue Name</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
            <% 
                List<Venue> venues = (List<Venue>) request.getAttribute("venues");
                if (venues != null) {
                    for (Venue venue : venues) { 
            %>
            <tr>
                <td><%= venue.getName() %></td>
                <td><%= venue.getAddress() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/venues/edit/<%= venue.getId() %>" class="action-link">Edit</a>
                    <a href="<%= request.getContextPath() %>/venues/delete/<%= venue.getId() %>" class="action-link">Delete</a>
                </td>
            </tr>
            <% 
                    } 
                }
            %>
        </table>
    </div>
</body>
</html>
