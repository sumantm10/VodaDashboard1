package vodadash;

import vodadash.randomnum;
import vodadash.Beans;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
 * Servlet implementation class input
 */
@WebServlet("/input")
public class input extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	
    public input() {
    	super();
        // TODO Auto-generated constructor stub
    }
    String id=randomnum.nextSessionId();
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String uid=id;
		Beans.connect();
		Date dt = new Date();
		Calendar calendar = new GregorianCalendar();
		int hour = calendar.get(Calendar.HOUR);
		int min = calendar.get(Calendar.MINUTE);
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		String date = dt.toString();
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		
		String time=(hour+":"+min);
		System.out.print(pass);
		try {
		if(!(pass.equals(pass1)))
		{
			
			out.println("<script> { alert('Passwords do not match')");
			out.println("location.href='Index.jsp' } </script>"); 
			System.out.print("checking");
		}
		}
		catch(Exception e1)
		{
			e1.getStackTrace();
			
		}
		try {
		String query = "SELECT COUNT(*) AS rowcount FROM users WHERE user_mail like '"+email+"'";
		Beans.dataRet(query);
		ResultSet dr=Beans.getRs();
		
			dr.next();
			int count = dr.getInt("rowcount");
			System.out.println(count);
			if(count>0)
			{
				out.println("<script> { alert('Email ID Already Registered!!')");
				out.println("location.href='Index.jsp' } </script>"); 
			}
			else
		{
			Users ob = new Users();
			ob.setName(name);
			ob.setDate(date);
			ob.setEmail(email);
			ob.setId(uid);
			ob.setNumber(number);
			ob.setPassword(pass);
			ob.setTime(time);
			Beans.connect();
			Beans.registration(ob);
			out.println("<script> { alert('Thanks for registering with us!!')");
			out.println("location.href='Index.jsp' } </script>"); 
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
		
		
		
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String uid=id;
		Beans.connect();
		Date dt = new Date();
		Calendar calendar = new GregorianCalendar();
		int hour = calendar.get(Calendar.HOUR);
		int min = calendar.get(Calendar.MINUTE);
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		String date = dt.toString();
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		
		String time=(hour+":"+min);
		System.out.print(pass);
		try {
		if(!(pass.equals(pass1)))
		{
			
			out.println("<script> { alert('Passwords does not match')");
			out.println("location.href='Index.jsp' } </script>"); 
			System.out.print("checking");
		}
		}
		catch(Exception e1)
		{
			e1.getStackTrace();
			
		}
		try {
			String query = "SELECT COUNT(*) AS rowcount FROM users WHERE user_mail like '"+email+"'";
			Beans.dataRet(query);
			ResultSet dr=Beans.getRs();
			
				dr.next();
				int count = dr.getInt("rowcount");
				System.out.println(count);
				if(count>0)
				{
					out.println("<script> { alert('Email ID Already Registered!!')");
					out.println("location.href='Index.jsp' } </script>"); 
				}
				else
			{
				Users ob = new Users();
				ob.setName(name);
				ob.setDate(date);
				ob.setEmail(email);
				ob.setId(uid);
				ob.setNumber(number);
				ob.setPassword(pass);
				ob.setTime(time);
				Beans.connect();
				Beans.registration(ob);
				
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
					message.setSubject("Welcome To Vodafone Dashboard");
					Beans.connect();
				String query1="select * from users where user_mail like'"+email+"'";
				
				Beans.dataRet(query1);
				ResultSet data = Beans.getRs();
				data.next();
				String msg = " Hello "+name+","
						+ "\n Welcome to vodafone STP Dashboard.\n"
						+ "\n\n Now You can access to the daily reports and updates about the vodafone STP Delhi.  \n"
						+ "\n\n For any further assisstance, feel free to contact us. "
						
						+ "\n\n Thank You!!"
						+ "\n\n\n\n Warm Regards,"
						+ "\n\n Vodafone Dashboard Team";
			
							message.setText(msg);
					Transport.send(message);
		 
					out.println("<script> { alert('Thank You for registering with us. Kindly check your mail for further details.')");
					out.println("location.href='Index.jsp' } </script>"); 
					
					System.out.println("Done");
					
		 
				}
			}
			catch (Exception e) {
					throw new RuntimeException(e);
				}
			}
				
			
		
			
			
	}


