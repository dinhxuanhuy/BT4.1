
import java.io.*;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.murach.survey.model.User;
@WebServlet("/submit_info")
public class SurveyServlet extends HttpServlet  {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Set UTF-8 encoding for request and response to handle Vietnamese
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String url = "/Thanks.jsp";

        // Get parameters from the request
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String hearAboutUs = request.getParameter("hearAboutUs");
        String receiveAnnouncementsStr = request.getParameter("receiveAnnouncements");
        String communicationMethod = request.getParameter("communicationMethod");

        // Convert date string to LocalDate
        LocalDate dateOfBirth = null;
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            dateOfBirth = LocalDate.parse(dateOfBirthStr);
        }

        // Convert checkbox value to boolean
        boolean receiveAnnouncements = "true".equals(receiveAnnouncementsStr);

        // Store data in User object
        User user = new User(firstName, lastName, email, dateOfBirth,
                           hearAboutUs, receiveAnnouncements, communicationMethod);

        // Set User object in request object and set URL
        request.setAttribute("user", user);
        url = "/Thanks.jsp";   // the "thanks" page

        // forward request and response objects to specified URL
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        // Set UTF-8 encoding for GET requests as well
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        doPost(request, response);
    }
}
