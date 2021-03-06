<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <title>DELETE Operation</title>
   </head>
   
   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
         url = "jdbc:mysql://localhost/capstone"
         user = "root" password = "Kala"/>
 
      <c:set var = "agent_ID" value = "103"/>
 
      <sql:update dataSource = "${snapshot}" var = "count">
         DELETE FROM agent WHERE Id = ?
         <sql:param value = "${agent_ID}" />
      </sql:update>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from agent;
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Agent Id</th>
            <th>Name</th>
            <th>Password</th>
            <th>Phone Number</th>
            <th>Address</th>
         </tr>
            
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td><c:out value = "${row.agentid}"/></td>
               <td><c:out value = "${row.name}"/></td>
               <td><c:out value = "${row.password}"/></td>
               <td><c:out value = "${row.phone}"/></td>
               <td><c:out value = "${row.address}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>