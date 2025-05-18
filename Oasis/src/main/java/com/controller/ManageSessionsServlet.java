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
import java.util.ArrayList;
import java.util.List;
import oasisdb.DBConnection;

public class ManageSessionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Viewing all sessions
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            response.sendRedirect("EditSessionServlet?sessionId=" + request.getParameter("sessionId")); // Redirect to edit session
        } else {
            viewSessions(request, response); // Default view sessions
        }
    }

    private void viewSessions(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<String[]> sessions = new ArrayList<>();

        String sql = "SELECT session_id, doctor_id, session_date, session_time, ward_id, room FROM Sessions";

        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql); 
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String[] sessionData = new String[] {
                    String.valueOf(rs.getInt("session_id")),
                    String.valueOf(rs.getInt("doctor_id")),
                    rs.getDate("session_date") != null ? rs.getDate("session_date").toString() : "N/A",
                    rs.getTime("session_time") != null ? rs.getTime("session_time").toString() : "N/A",
                    String.valueOf(rs.getInt("ward_id")),
                    rs.getString("room") != null ? rs.getString("room") : "N/A"
                };
                sessions.add(sessionData);
            }

            request.setAttribute("sessions", sessions);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
            return;
        }

        request.getRequestDispatcher("viewSessions.jsp").forward(request, response);
    }

    // Adding a session
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addSession(request, response);
        } else if ("delete".equals(action)) {
            deleteSession(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
        }
    }

    // Adding a session
    private void addSession(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String doctorId = request.getParameter("doctorId");
        String sessionDate = request.getParameter("sessionDate");
        String sessionTime = request.getParameter("sessionTime");
        String wardId = request.getParameter("wardId");
        String room = request.getParameter("room");

        if (sessionTime == null || !sessionTime.matches("\\d{2}:\\d{2}")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid time format. Please use HH:mm.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO Sessions (doctor_id, session_date, session_time, ward_id, room) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(doctorId));
                stmt.setDate(2, java.sql.Date.valueOf(sessionDate));
                stmt.setTime(3, java.sql.Time.valueOf(sessionTime + ":00"));
                stmt.setInt(4, Integer.parseInt(wardId));
                stmt.setString(5, room);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("ManageSessionsServlet"); // Redirect to view sessions
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }

    // Deleting a session
    private void deleteSession(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String sessionId = request.getParameter("sessionId");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM Sessions WHERE session_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(sessionId));
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("ManageSessionsServlet"); // Redirect to view sessions
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Session not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
