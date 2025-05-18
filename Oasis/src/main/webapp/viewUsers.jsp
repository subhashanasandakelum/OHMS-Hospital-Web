<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.login.User" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h1>All Users</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Role</th>
        </tr>
        <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getRole() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="3">No users found.</td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
