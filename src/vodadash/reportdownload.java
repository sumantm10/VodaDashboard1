package vodadash;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reportdownload
 */
@WebServlet("/reportdownload")
public class reportdownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 4096;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportdownload() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String dbURL = "jdbc:mysql://127.0.0.1/test";
    private String dbUser = "root";
    private String dbPass = "1234";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null; // connection to the database
        String filename = request.getParameter("param");
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // queries the database
            String sql = "SELECT * FROM reports WHERE filename like ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, filename);
 
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // gets file name and file blob data
               // String fileName = result.getString("file_name");
                Blob blob = result.getBlob("data");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                 
                System.out.println("fileLength = " + fileLength);
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
                String mimeType = context.getMimeType(filename);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                }              
                 
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("inline; filename=\"%s\"", filename);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
                response.getWriter().print("File not found for the name: " + filename);  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
	        System.out.println("Loaded driver");
	        conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","1234");
		String filename=request.getParameter("param");
		System.out.println(filename);
		System.out.println("checking");
		Beans.connect();
		String query = "select * from `reports` where filename like '"+filename+"'";
		Beans.dataRet(query);
		ResultSet rs = Beans.getRs();
		//rs.next();
		//int n = rs.getInt("rowcount");
		if(rs.next())
		{
		Blob blob = rs.getBlob(6);
		
		InputStream inputStream = blob.getBinaryStream();
		int fileLength = inputStream.available();
		
		System.out.println("fileLength = " + fileLength);
		 
        ServletContext context = getServletContext();

        // sets MIME type for the file download
        String mimeType = context.getMimeType(filename);
        if (mimeType == null) {        
            mimeType = "application/octet-stream";
        }              
         
        // set content properties and header attributes for the response
        response.setContentType(mimeType);
        response.setContentLength(fileLength);
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", filename);
        response.setHeader(headerKey, headerValue);

        // writes the file to the client
        OutputStream outStream = response.getOutputStream();
         
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
         
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
         
        inputStream.close();
        outStream.close();             
    } 
	else 
    {
        // no file found
        response.getWriter().print("File not found for the file name: " + filename);  
    }
} catch (SQLException ex) {
    ex.printStackTrace();
    response.getWriter().print("SQL Error: " + ex.getMessage());
} catch (IOException ex) {
    ex.printStackTrace();
    response.getWriter().print("IO Error: " + ex.getMessage());
} 
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} finally {
    if (conn != null) {
        // closes the database connection
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }         
} 
	}

}
