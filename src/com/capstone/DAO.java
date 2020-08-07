package com.capstone;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
    private String JDBCUrl = "jdbc:mysql://localhost:3306/capstone";
    private String JDBCUser = "root";
    private String JDBCPass = "Kala";
    private Connection jdbcConnection;
    private Statement statement;
    private ResultSet resultSet = null;

    Agent agent = new Agent();

    public void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
              try {
                Class.forName("com.mysql.cj.jdbc.Driver");

            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(JDBCUrl, JDBCUser, JDBCPass);
            System.out.println("Connection established " );
            
        }
    }

    public void insert(String name,String password, String phone, String address) throws SQLException{

                           connect();
                  PreparedStatement statement = jdbcConnection.prepareStatement("insert into agent(name,password,phone,address)values(?,?,?,?);");
                           statement.setString(1,name);
                           statement.setString(2,password);
                           statement.setString(3,phone);
                           statement.setString(4,address);
                           int x = statement.executeUpdate();
                           if (x> 0){
                                         System.out.println("Agent Registered...");
                                         
                           }
                           else {
                                         System.out.println("Failed....");
                           
              }
              jdbcConnection.close();



      
    }

    
    public void read() throws SQLException {
              connect();
              statement=jdbcConnection.createStatement();
              String sql ="select * from agent";
              resultSet = statement.executeQuery(sql);
              while(resultSet.next()){
              
              String name = resultSet.getString("name");
              agent.setName(name);
              resultSet.getString("password");
              resultSet.getString("phone");
              resultSet.getString("address");
              
              }
}}
