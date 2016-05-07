package vodadash;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;


public class DB {
	/*public static void main(String[] args) {
        DB db = new DB();
        Connection conn=db.dbConnect("jdbc:mysql://127.0.0.1/test","root","1234");
        //Beans.connect();
        db.insertPDF(conn,"d://new folder//Grade Sheetm.pdf");
        db.getPDFData(conn);
    }
	*/
     
    public DB() {}
     
    public Connection dbConnect(String db_connect_string,
            String db_userid, String db_password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    db_connect_string, db_userid, db_password);
             
            System.out.println("connected");
            return conn;
             
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
     
    public void insertPDF(Connection conn,String filename) {
        int len,i=1;
        String query;
        PreparedStatement pstmt;
         
        try {
            File file = new File(filename);
            FileInputStream fis = new FileInputStream(file);
            len = (int)file.length();
            
            query = ("insert into files VALUES(?,?,?,?)");
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,i);
            i++;
            pstmt.setString(2,file.getName());
            pstmt.setInt(3, len);
             
            //method to insert a stream of bytes
            pstmt.setBinaryStream(4, fis, len); 
            pstmt.executeUpdate();
             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     
    public void getPDFData(Connection conn) {
         
        byte[] fileBytes;
        String query;
        try {
            query = 
              "select data from files where filename like '%.pdf%'";
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(query);
            if (rs.next()) {
                fileBytes = rs.getBytes(1);
                OutputStream targetFile=  new FileOutputStream(
                        "d://new folder//newtest.pdf");
                targetFile.write(fileBytes);
                targetFile.close();
            }
             
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
};