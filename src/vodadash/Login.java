package vodadash;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		Beans.connect();
		int count;
		String email1=request.getParameter("email1");
		String passw=request.getParameter("passw");
		try {
		String query="select count(*) as rowcount from users where user_mail like'"+email1+"'";
		Beans.dataRet(query);
		ResultSet rs = Beans.getRs();
		rs.next();
		count = rs.getInt("rowcount");
		if(count<1)
		{
			out.println("<script> { alert('This email id is not registered with us.Please enter a valid email id.')");
			out.println("location.href='Index.jsp' } </script>"); 
		}
		else
		{
			
		String query1="select count(*) as validuser from users where user_mail like '"+email1+"' and password like '"+passw+"'";
		
		Beans.dataRet(query1);
		ResultSet rt = Beans.getRs();
		rt.next();
		int chkvalid = rt.getInt("validuser");
		if(chkvalid!=1)
		{
			out.println("<script> { alert('Entered wrong Email ID or password. Try again.')");
			out.println("location.href='Index.jsp' } </script>"); 
		}
		else if(chkvalid==1)
		{
			HttpSession session = request.getSession();
			Beans.connect();
			String query5 = "select * from users where user_mail like '"+email1+"'";
			Beans.dataRet(query5);
			ResultSet rs2 = Beans.getRs();
			rs2.next();
			String name = new String(rs2.getString(2));
			session.setAttribute("name", name);
			System.out.println(name);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
		}
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}
		
	
	}
