package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oasisdb.DBConnection;

public class EditSessionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Load session data for editing
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String sessionId = request.getParameter("sessionId");
        loadSessionForEdit(request, response, sessionId);
    }

    private void loadSessionForEdit(HttpServletRequest request, HttpServletResponse response, String sessionId) 
            throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT doctor_id, session_date, session_time, ward_id, room FROM Sessions WHERE session_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(sessionId));
                try (ResultSet rs = stmt.executeQuery()) {
                     if (rs.next()) {
                        request.setAttribute("sessionId", sessionId);
                        request.setAttribute("doctorId", rs.getInt("doctor_id"));
                        request.setAttribute("sessionDate", rs.getDate("session_date").toString());
                        request.setAttribute("sessionTime", rs.getTime("session_time").toString());
                        request.setAttribute("wardId", rs.getInt("ward_id"));
                        request.setAttribute("room", rs.getString("room"));
                        
                        request.getRequestDispatcher("editSessions.jsp").forward(request, response);
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Session not found.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid session ID format.");
        }
    }

    // Handle the edit action
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            editSession(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    private void editSession(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String sessionId = request.getParameter("sessionId");
        String doctorId = request.getParameter("doctorId");
        String sessionDate = request.getParameter("sessionDate");
        String sessionTime = request.getParameter("sessionTime");
        String wardId = request.getParameter("wardId");
        String room = request.getParameter("room");

        // Validate time format
        if (sessionTime == null || !(sessionTime.matches("\\d{2}:\\d{2}:\\d{2}") || sessionTime.matches("\\d{2}:\\d{2}"))) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid time format. Please use HH:mm or HH:mm:ss.");
            return;
        }

        // Use the appropriate time format
        String formattedSessionTime = sessionTime.matches("\\d{2}:\\d{2}") ? sessionTime + ":00" : sessionTime;

        // Validate date format
        if (sessionDate == null || sessionDate.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format. Please use YYYY-MM-DD.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE Sessions SET doctor_id = ?, session_date = ?, session_time = ?, ward_id = ?, room = ? WHERE session_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(doctorId));
                stmt.setDate(2, java.sql.Date.valueOf(sessionDate));
                stmt.setTime(3, java.sql.Time.valueOf(formattedSessionTime)); // Use the formatted session time
                stmt.setInt(4, Integer.parseInt(wardId));
                stmt.setString(5, room);
                stmt.setInt(6, Integer.parseInt(sessionId)); // Set the sessionId for the WHERE clause

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("ManageSessionsServlet"); // Redirect to view sessions
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Session not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date or time format.");
        }
    }

}


