<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>








<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        
    </head>
    <body>
        <h1>Student Update</h1>
        
        <div class="row">
             <div class="col-sm-4">  <%  //--> For form creation....%>
            
                <form  method="POST" action="#">
                    
            <%
                //JDBC..for fetch data from id..
                Connection con;
                PreparedStatement pst;
                ResultSet rs;

                Class.forName("oracle.jdbc.driver.OracleDriver");

                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","school","school");
        
                String id= request.getParameter("id");
                
                pst= con.prepareStatement("select * from records where id=?");
                
                pst.setString(1, id);
                
                rs= pst.executeQuery();
                
                while(rs.next())
                {
                  
            %>
                 
                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%=rs.getString("stname")%>" name="sname" id="sname" required>
                    </div>    
                    
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%=rs.getString("course")%>"  name="course" id="course" required>
                    </div> 
                    
                    <div align="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%=rs.getString("fee")%>" name="fee" id="fee" required>
                    </div>
            <%
                }
            
            %>
                    </br>
                    <div align="left">
                        <input type="submit" value="Submit" name="submit" id="submit" class="btn btn-info" >
                        <input type="reset" value="Reset" name="reset" id="reset" class="btn btn-warning" >
                    </div>
                    
                    
                    
                </form>
                
            </div>
        
        
        
        </div>
        
        
        
        
        
        
    </body>
</html>
