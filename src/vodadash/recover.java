package vodadash;

import vodadash.Beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class recover
 */
@WebServlet("/recover")
public class recover extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recover() {
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
		try {
		PrintWriter out=response.getWriter();
		Beans.connect();
		String email = request.getParameter("email");
		
		String query="select count(*) as rowcount from users where user_mail like '"+email+"'";
		Beans.dataRet(query);
		ResultSet rs = Beans.getRs();
		rs.next();
		int count = rs.getInt("rowcount");
		System.out.println(count);
		if(count<1)
		{
			System.out.println("checking");
			 
			out.println("<script> { alert('This email id is not registered with us.Please enter a valid email id.')");
			out.println("location.href='forgotid.jsp' } </script>"); 
		}
		else
		{
			final String username = "vodafonedashboard@gmail.com";
			final String password = "vodafone1234";
			
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			
			Session session = Session.getInstance(props,
			  new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			  });
	 
				Message message = new MimeMessage(session);
				
				message.setFrom(new InternetAddress("vodafonedashboard@gmail.com"));
				message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
				message.setSubject("Recovery mail");
				Beans.connect();
			String query1="select * from users where user_mail like'"+email+"'";
			
			Beans.dataRet(query1);
			ResultSet dt = Beans.getRs();
			dt.next();
			String msg = " Hello "+dt.getString(2)+","
					+ "\n You requested for the recovery of your vodafone dashboard account.\n"
					+ "\n\n You account details are \n"
					+ " User name : "+dt.getString(4)+""
					+ "\n Password : "+dt.getString(7)+""
					+ "\n\n Thank You!!"
					+ "\n\n\n\n Warm Regards,"
					+ "\n\n Vodafone Dashboard Team";
		
						message.setText(msg);
				Transport.send(message);
	 
				out.println("<script> { alert('An email regarding your account recovery has been sent to your email id.')");
				out.println("location.href='Index.jsp' } </script>"); 
				
				System.out.println("Done");
				
	 
			}
		}
		catch (MessagingException | SQLException e) {
				throw new RuntimeException(e);
			}
		}
		}
				
		
	


