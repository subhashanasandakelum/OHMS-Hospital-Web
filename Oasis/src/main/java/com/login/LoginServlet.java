package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oasisdb.DBConnection;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Authenticate user
        User user = authenticate(username, password, role);

        if (user != null) {
            // User authenticated
            HttpSession session = request.getSession();
            session.setAttribute("role", user.getRole());
            session.setAttribute("username", user.getUsername());
            
            // Redirect based on role
            switch (user.getRole()) {
                case "Patient":
                    response.sendRedirect("#");
                    break;
                case "Doctor":
                    response.sendRedirect("ManageSessionsServlet");
                    break;
                case "Nurse":
                    response.sendRedirect("nurseDashboard.jsp");
                    break;
                case "Pharmacist":
                    response.sendRedirect("manageproduct.jsp");
                    break;
                default:
                    // Handle unknown role
                    response.sendRedirect("LogIn.jsp?error=Unknown role");
                    break;
            }
        } else {
            // Authentication failed
            response.sendRedirect("LogIn.jsp?error=Invalid username or password");
        }
    }

    private User authenticate(String username, String password, String role) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE username = ? AND password = ? AND role = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("role"));
                    user.setPassword(password); // Optional: Set password if needed later
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}

