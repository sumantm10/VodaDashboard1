package vodadash;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class feedbackmail
 */
@WebServlet("/feedbackmail")
public class feedbackmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedbackmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		final String username = "vodafonedashboard@gmail.com";
		final String password = "vodafone1234";
		String email=request.getParameter("emailf");
		String name=request.getParameter("namef");
		//String num=request.getParameter("tb2");
		String msg=request.getParameter("messagef");
 
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
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("vodafonedashboard@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(username));
			message.setSubject("Feedback from '"+email+"' '"+name+"'");
			message.setText("'"+msg+"'");
 
			Transport.send(message);
 
			System.out.println("Done");
			out.println("<html><body>");
			out.println("<link rel='stylesheet' type='text/css' href='design1.css'>");
			out.println("<script> { alert('You feedback is successfully submitted.Thank You for your time')");
			out.println("location.href='home.jsp' } </script>");
			out.println("</body></html>");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		try {
			 
			Message message2 = new MimeMessage(session);
			message2.setFrom(new InternetAddress("vodafonedashboard@gmail.com"));
			message2.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(email));
			message2.setSubject("Thank You for your feedback");
			message2.setText("You feedback was : \n '"+msg+"' \n\n\n"
					+"We will work on it in the best way possible.\n\n\n"
					+ "Regards,\nSumant Mudgal\nVodafone Dashboard Team");
 
			Transport.send(message2);
 
			System.out.println("Done");
			/*out.println("<html><body>");
			out.println("<link rel='stylesheet' type='text/css' href='design1.css'>");
			out.println("<script> { alert('You feedback is successfully submitted.Thank You for your time'); } </script>");
			out.println("</body></html>");*/
		} catch (MessagingException e2) {
			throw new RuntimeException(e2);
		}
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
