<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.murach.survey.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You - Murach Survey</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .result-section {
            margin: 20px 0;
        }

        .result-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .result-table tr {
            border-bottom: 1px solid #e0e0e0;
        }

        .result-table td {
            padding: 15px 10px;
        }

        .result-table td:first-child {
            font-weight: 600;
            color: #667eea;
            width: 45%;
        }

        .result-table td:last-child {
            color: #333;
        }

        .success-message {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
            padding: 20px;
            border-radius: 12px;
            border: 2px solid #b1dfbb;
            margin-bottom: 30px;
            text-align: center;
            font-size: 18px;
            font-weight: 500;
        }

        .success-icon {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .back-button {
            display: inline-block;
            padding: 15px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            text-align: center;
            margin-top: 20px;
        }

        .back-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .highlight-value {
            background: #f8f9fa;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }

        .badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .badge-yes {
            background: #d4edda;
            color: #155724;
        }

        .badge-no {
            background: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <main>
        <header>
            <img src="Murach_image.jpg" alt="Murach Logo" class="logo">
        </header>

        <%
            User user = (User) request.getAttribute("user");
            if (user != null) {
        %>

        <section class="survey-intro">
            <div class="success-message">
                <div class="success-icon">✓</div>
                <h1 style="margin: 0; border: none; padding: 0;">Thank You for Your Submission!</h1>
                <p style="margin: 10px 0 0 0;">We appreciate you taking the time to complete our survey.</p>
            </div>
        </section>

        <section class="result-section">
            <h2>Your Survey Information</h2>

            <table class="result-table">
                <tr>
                    <td>First Name:</td>
                    <td><span class="highlight-value"><%= user.getFirstName() %></span></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><span class="highlight-value"><%= user.getLastName() %></span></td>
                </tr>
                <tr>
                    <td>Email Address:</td>
                    <td><span class="highlight-value"><%= user.getEmail() %></span></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td><span class="highlight-value"><%= user.getDateOfBirth() != null ? user.getDateOfBirth() : "Not provided" %></span></td>
                </tr>
                <tr>
                    <td>How did you hear about us:</td>
                    <td><span class="highlight-value"><%= user.getHearAboutUs() != null ? user.getHearAboutUs() : "Not specified" %></span></td>
                </tr>
                <tr>
                    <td>Receive Announcements:</td>
                    <td>
                        <span class="badge <%= user.isReceiveAnnouncements() ? "badge-yes" : "badge-no" %>">
                            <%= user.isReceiveAnnouncements() ? "Yes ✓" : "No ✗" %>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>Preferred Communication Method:</td>
                    <td><span class="highlight-value"><%= user.getCommunicationMethod() != null ? user.getCommunicationMethod() : "Not selected" %></span></td>
                </tr>
            </table>
        </section>

        <section class="result-section">
            <p style="text-align: center; color: #666; font-size: 15px;">
                We have received your information and will keep you updated based on your preferences.
            </p>
        </section>

        <%
            } else {
        %>

        <section class="survey-intro">
            <h1>No Data Found</h1>
            <p>Sorry, we couldn't find your survey data. Please try submitting the form again.</p>
        </section>

        <%
            }
        %>

        <footer style="text-align: center;">
            <a href="index.html" class="back-button">← Return to Survey Form</a>
        </footer>
    </main>
</body>
</html>
