/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import java.sql.*;

/**
 *
 * @author nmahadev
 */
public class DBConnect {

  // driver and connection string variables
  private final String driver = "com.mysql.jdbc.Driver";
  private final String url = "jdbc:mysql://localhost:3306/attic";
  private final String user = "mahadev";
  private final String pwd = "mahadev";

  // JDBC variables and methods
  private Connection conn = null;
  private Statement stm = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;
  private ResultSetMetaData rsmd = null;

  // The two private methods below are used to open and close DB
  private String open() {
    String message = "Opened";
    try {
      Class.forName(driver); // load driver
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }

  private String close() {
    String message = "Closed";
    try {
      stm.close();
      conn.close();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }

  // Business logic: Method to insert data
  public String insertData(String sql) {
    String message = open();
    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        message = close();
      } catch (Exception e) {
        message = e.getMessage();
      }
    }
    return message;
  }

  // Business logic: Method to display query as html table
  public String htmlTable(String sql) {
    String result = "<table>\n";
    String message = open();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        // create column headings
        result += "<tr>\n";
        for (int i = 0; i < count; i++) {
          result += "<th>" + rsmd.getColumnName(i + 1) + "</th>\n";
        }
        result += "</tr>\n";
        // create data rows
        while (rst.next()) {
          result += "<tr>\n";
          for (int i = 0; i < count; i++) {
            result += "<td>" + rst.getString(i + 1) + "</td>\n";
          }
          result += "</tr>\n";
        }
        result += "</table>\n";
        message = close();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }

  // Business logic: Method to verify password. Avoids SQL injection
  public String isPwdValid(String sql, String user, String pwd) {
    String result = "Error: ";
    String message = open();
    if (message.equals("Opened")) {
      try {
        pstm = conn.prepareStatement(sql);
        pstm.setString(1, user);
        pstm.setString(2, pwd);
        rst = pstm.executeQuery();
        if (rst.next()) {
          result = rst.getString(3);
        }
      } catch (Exception e) {
        result += e.getMessage();
      }
      close();
      return result;
    } else {
      result += message;
      return result;
    }
  }
  // Business logic: Method to create html code for dropdown.  Lists options

  public String dropdown(String sql) {
    String result = "<option disabled selected>Select one ...</option>\n";
    String message = open();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        while (rst.next()) {
          result += "<option value='" + rst.getInt(1) + "'>";
          for (int i = 2; i <= count; i++) {
            result += rst.getString(i) + " ";
          }
          result += "</option>\n";
        }
        message = close();
        return result;
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
}
