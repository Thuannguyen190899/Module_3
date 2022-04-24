import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float description = Float.parseFloat(request.getParameter("description"));
        float price = Float.parseFloat(request.getParameter("price"));

        double discountPercent = price * description * 0.01;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Rate: " + description + "</h1>");
        writer.println("<h1>USD: " + price + "</h1>");
        writer.println("<h1>VND: " + discountPercent + "</h1>");
        writer.println("</html>");
    }
}
