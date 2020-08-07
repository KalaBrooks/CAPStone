<%@page import="com.capstone.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        #main {


            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            font-family: verdana;

        }

        aside {
            float: left;
            width: 30%;
            margin-bottom: 20px;
            height: 100%;
        }


        main {
            float: right;
            width: 70%;
            margin-bottom: 20px;

        }

        h1,
        p,
        img,
        header,
        nav {

            display: block;
        }

        header {
            color: white;
            background-color: black;

        }

        nav {
            width: 1000px;
            height: 60px;
            margin: 0 auto 20px;
            bottom: 50px;
        }

        nav ul {
            list-style-type: none;

        }

        nav ul li {
            float: left;
            padding: 16px;
        }

        nav ul li a {
            text-decoration: none;
            color: inherit;
        }

      
        button:hover {
            background-color: white;
            color: rgb(255, 115, 0);
            border-bottom: 5px solid rgb(255, 115, 0);

        }

        #tab {
            list-style: none;
        }

        #tab li {
            padding: 10px 0;
        }
    </style>
</head>

<body>
    <nav class="nav ">
       <a class="nav-link active bg-danger text-white"" href="index.html">Home</a>
        <a class="nav-link bg-danger text-white"" href=" #">Account</a>
        <a class="nav-link bg-danger text-white"" href="agents.jsp">Agents</a>
    </nav>
    <div id="main">
        <aside>

            <img src="https://www.designmantic.com/logo-images/166882.png?company=Company+Name&slogan=&verify=1"
                height="100" height="100" style="padding: 10px; margin: 10 auto;">
            <h1>Cap Car Company</h1>

            <ul id="tab">


            </ul>




        </aside>
        <main>
        
           
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
         url = "jdbc:mysql://localhost/capstone"
         user = "root"  password = "Kala"/>
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from agent;
      </sql:query>
      <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Agent ID</th>
      <th scope="col">Agent Name</th>
      <th scope="col">Password</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Address</th>
      
      <c:forEach var = "row" items = "${result.rows}">
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><c:out value = "${row.agent_id}"/></td>
      <td><c:out value = "${row.name}"/></td>
      <td><c:out value = "${row.password}"/></td>
      <td><c:out value = "${row.phone}"/></td>
      <td><c:out value = "${row.address}"/></td>
      
    </tr>
    </c:forEach>
    
  </tbody>
</table>


        </main>
    </div>


</body>

</html>



