package com.murach.survey.model;

import java.io.Serializable;
import java.time.LocalDate;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private LocalDate dateOfBirth;
    private String hearAboutUs;
    private boolean receiveAnnouncements;
    private String communicationMethod;

    // Default constructor
    public User() {
    }

    // Constructor with all fields
    public User(String firstName, String lastName, String email, LocalDate dateOfBirth,
                String hearAboutUs, boolean receiveAnnouncements, String communicationMethod) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.hearAboutUs = hearAboutUs;
        this.receiveAnnouncements = receiveAnnouncements;
        this.communicationMethod = communicationMethod;
    }

    // Getters and Setters
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getHearAboutUs() {
        return hearAboutUs;
    }

    public void setHearAboutUs(String hearAboutUs) {
        this.hearAboutUs = hearAboutUs;
    }

    public boolean isReceiveAnnouncements() {
        return receiveAnnouncements;
    }

    public void setReceiveAnnouncements(boolean receiveAnnouncements) {
        this.receiveAnnouncements = receiveAnnouncements;
    }

    public String getCommunicationMethod() {
        return communicationMethod;
    }

    public void setCommunicationMethod(String communicationMethod) {
        this.communicationMethod = communicationMethod;
    }

    @Override
    public String toString() {
        return "User{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", hearAboutUs='" + hearAboutUs + '\'' +
                ", receiveAnnouncements=" + receiveAnnouncements +
                ", communicationMethod='" + communicationMethod + '\'' +
                '}';
    }
}

