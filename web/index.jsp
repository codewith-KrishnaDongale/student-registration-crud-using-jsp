<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit")!= null)
    {
    
        String name=request.getParameter("sname");
        String course=request.getParameter("course");
        String fee=request.getParameter("fee");
        
        
        //JDBC..for add data..
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","school","school");
        
        pst=con.prepareStatement("insert into records (id,stname,course,fee) values(id.nextval,?,?,?)");
        
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        
        pst.executeUpdate();
    
    %>
    
    <script>
        
        alert("Record Added.....!");
        
    </script>
  
    <%
    }

    %>

<!DOCTYPE html>

<html>
    
    <head>
        
       <meta charset="utf-8">
       <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
       
    </head>
    <body>
        </br></br>
    <center><h1>Student Registration System CRUD using-JSP</h1></center>
        </br>
        <div class="row" >
            
        
            <div class="col-sm-4">  <%  //--> For form creation....%>
            
                <form  method="POST" action="#">
                 
                    <div align="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
                    </div>    
                    
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
                    </div> 
                    
                    <div align="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
                    </div>
                    </br>
                    <div align="left">
                        <input type="submit" value="Submit" name="submit" id="submit" class="btn btn-info" >
                        <input type="reset" value="Reset" name="reset" id="reset" class="btn btn-warning" >
                    </div>
                    
                    
                    
                </form>
                
            </div>
            
            <div class="col-sm-8">  <%  //--> For table creation....%>
                
                <div class="panel-body">
                    
                    </br>
                    <table id="tb1-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
                            <%
                            
                            //JDBC..for take data from sql and put into front-end ..
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            Statement stmt;

                            Class.forName("oracle.jdbc.driver.OracleDriver");

                            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","school","school");

                            stmt = con.createStatement();
                            
                            rs = stmt.executeQuery("select * from records");
                            
                            
                            while(rs.next())
                            {
                            
                            String id= rs.getString("id");
                            
                            
                            
                            
                            
                            %>
                            
                            
                            
                            
                            <tr>
                                <td><%= rs.getString("stname") %></td>
                                <td><%= rs.getString("course") %></td>
                                <td><%= rs.getString("fee") %></td>
                                <td><a href="update1.jsp?id=<%= id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%= id%>">Delete</a></td>
                                
                            </tr>
                    
                    
                    <%
                    }
                    %>
                    
                    
                    
                    </table>    
                    
                    
                    
                </div>
                
                
                
                
                
                
                
                
                
            </div>
            
            
        </div>   
            
            
            
            
            
            
    </body>
</html>
