import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers= new ArrayList<>();
        customers.add(new Customer("Anna", "1998", "Le Van Hien","pic1.jfif"));
        customers.add(new Customer("Vinh", "2001", "Chau Thi Vinh Te", "pic2.jfif"));
        customers.add(new Customer("Khanh", "2002", "nguyen tat thanh", "pic3.jfif"));
        customers.add(new Customer("Binh", "2000", "Tran Phu", "pic4.jfif"));
        customers.add(new Customer("Ngan", "1999", "Le Duan", "pic5.jfif"));
        request.setAttribute("customers", customers);
        request.setAttribute("test","abc");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
