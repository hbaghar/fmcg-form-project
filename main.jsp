<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import ="java.text.DateFormat" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.naming.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
boolean assignVal(String status){
	if(status.equalsIgnoreCase("on"))
		return true;
	else
		return false;
}
%>

<%
Date currTS=new java.util.Date();
String timestamp=  DateFormat.getInstance().format(currTS);  

String brand_name= request.getParameter("brand_name");
String est_name= request.getParameter("est_name");
String address= request.getParameter("address");
String city= request.getParameter("city");
String state= request.getParameter("state");
String pin_code= request.getParameter("pin_code");
String ph_num= request.getParameter("ph_num");
String website= request.getParameter("website");

boolean avl_local_stores=assignVal(request.getParameter("loc_neig_store"));
boolean avl_across_state=assignVal(request.getParameter("across_state"));
boolean avl_food_chains=assignVal(request.getParameter("food_chains"));
boolean prod_dry_snack=assignVal(request.getParameter("ind_dry_snack"));
boolean prod_frozen_food=assignVal(request.getParameter("frozen_food"));
boolean prod_biscuits_bakery=assignVal(request.getParameter("biscuits_bakery"));
boolean prod_drinks=assignVal(request.getParameter("drinks"));
boolean prod_sweets_candies=assignVal(request.getParameter("sweets"));


String driverName = "com.mysql.jdbc.Driver";
//String connectionUrl = "jdbc:mysql://202.138.122.237:3306/mysql";
String connectionUrl = "jdbc:mysql://localhost:3306/test";
String userId = "root";
String password = "base@123";
try 
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
System.out.println("driver found");
} 
catch (Exception e) {
System.out.println("driver not found" +e.getMessage());
}

Connection connection=null;
PreparedStatement prs;
ResultSet resultSet = null;

try
{ 
	connection = DriverManager.getConnection(connectionUrl,userId,password);
	System.out.println("Connected successfully");

String sql= "INSERT INTO test.SURVEY (timestamp, brand_name, est_name, city, state, pin_code, ph_num, address, website, avl_local_stores, avl_across_state, avl_food_chains, prod_dry_snack, prod_frozen_food, prod_drinks, prod_biscuits_bakery, prod_sweets_candies, usr_location) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

prs=connection.prepareStatement(sql);

prs.setString(1,timestamp);
prs.setString(2,brand_name);
prs.setString(3,est_name);
prs.setString(4,city);
prs.setString(5,state);
prs.setString(6,pin_code);
prs.setString(7,ph_num);
prs.setString(8,address);
prs.setString(9,website);
prs.setBoolean(10,avl_local_stores);
prs.setBoolean(11,avl_across_state);
prs.setBoolean(12,avl_food_chains);
prs.setBoolean(13,prod_dry_snack);
prs.setBoolean(14,prod_frozen_food);
prs.setBoolean(15,prod_drinks);
prs.setBoolean(16,prod_biscuits_bakery);
prs.setBoolean(17, prod_sweets_candies);
prs.setString(18, "not available NA");

prs.executeUpdate();
/*ResultSet rs = prs.executeQuery("SELECT * FROM SURVEY");
    while (rs.next()) {
        System.out.println(rs.getString(2));
    }
*/   
    rs.close();
    prs.close();
    connection.close();
}
catch(Exception se){

System.out.println(se.getMessage());
System.out.println("Something went wrong");
se.printStackTrace();
}
finally{System.out.println("finally block is always executed");}  

%>

<!DOCTYPE html>    
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="utf-8">
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
    <link rel="stylesheet" type="text/css" href="style1.css" >
	<title>Thank you!</title>
</head>
<body>
    <div class="row page-header" id="header">
        <div class="col-xs-5" align="center">
            <img src="https://media.licdn.com/mpr/mpr/shrink_200_200/AAEAAQAAAAAAAAjOAAAAJDFmMTM1NzA0LTQxZGYtNDBjNS1iNTc4LWI2Y2FiODMyYTkzYg.png" id="proteusLogo" height="100px"/>
        </div>
        <div class="col-xs-7" align="left" style="margin-top:25px"><h4>Indian FMCG Data Collection Form</h4></div>		
    </div>
    <div class="container-fluid">
        <div class="jumbotron" id="message">
            <p>Thank you! Your response has been recorded!</p>
            <p><a href="index.html">Click here</a> to submit another response.</p>
        </div>
    </div>
    <footer class="footer" id="footer" align="center">
        <div class="container">
           <p>&copy; 2017 Proteus Tech Pvt. Ltd.</p>
        </div>
    </footer>
</body>
</html>

