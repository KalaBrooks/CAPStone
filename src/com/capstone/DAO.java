package com.capstone;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DAO {
    private String JDBCUrl = "jdbc:mysql://localhost:3306/capstone";
    private String JDBCUser = "root";
    private String JDBCPass = "markos";
    private Connection jdbcConnection;
    private Statement statement;
    Scanner scanner = new Scanner(System.in);
    Agent agent = new Agent();

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(JDBCUrl, JDBCUser, JDBCPass);
            System.out.println("Connection established with " + JDBCUrl);
        }
    }

    public void insert() throws SQLException{


            System.out.println("What is your name?");
            String name = scanner.nextLine();
        System.out.println("What is your password?");
        String password = scanner.nextLine();
        System.out.println("What is your phone number?");
        String phoneNumber = scanner.nextLine();
        System.out.println("What is your address?");
        String address = scanner.nextLine();

            String insertSql = "insert into agent(name,password,phone,Address)values('"+name+"','"+password+"','"+ phoneNumber+"','"+address+"');";
            agent.setName(name);
        agent.setPassword(password);
        agent.setPhone(phoneNumber);
        agent.setAddress(address);

        this.connect();
            statement = jdbcConnection.createStatement();
            statement.executeUpdate(insertSql);

      
    }


}


