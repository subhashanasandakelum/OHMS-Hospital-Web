package com.controller;

import java.sql.Date;
import java.sql.Time;

public class Session {
    private int sessionId;
    private int doctorId;
    private Date sessionDate;
    private Time sessionTime;
    private int wardId;
    private String room;

    public Session(int sessionId, int doctorId, Date sessionDate, Time sessionTime, int wardId, String room) {
        this.setSessionId(sessionId);
        this.setDoctorId(doctorId);
        this.setSessionDate(sessionDate);
        this.setSessionTime(sessionTime);
        this.setWardId(wardId);
        this.setRoom(room);
    }

	public int getSessionId() {
		return sessionId;
	}

	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public Date getSessionDate() {
		return sessionDate;
	}

	public void setSessionDate(Date sessionDate) {
		this.sessionDate = sessionDate;
	}

	public Time getSessionTime() {
		return sessionTime;
	}

	public void setSessionTime(Time sessionTime) {
		this.sessionTime = sessionTime;
	}

	public int getWardId() {
		return wardId;
	}

	public void setWardId(int wardId) {
		this.wardId = wardId;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

}

