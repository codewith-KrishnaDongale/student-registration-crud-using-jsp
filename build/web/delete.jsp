<%@page import="java.sql.*" %>

<%
    
        String id=request.getParameter("id");
      
        
        
        //JDBC..for add data..
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","school","school");
        
        pst=con.prepareStatement("delete from records where id=?");
       
        pst.setString(1, id);
        
        pst.executeUpdate();
    
    %>
    
    <script>
        
        alert("Record Deleted.....!");
        
    </script>
  
   