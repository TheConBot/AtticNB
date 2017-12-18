/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import com.google.gson.Gson;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.*;
import java.util.*;

public class DBConnect {

  private final String driver = "com.mysql.jdbc.Driver";
  private final String url = "jdbc:mysql://localhost:3306/attic";
  private final String user = "mahadev";
  private final String pwd = "mahadev";

  private Connection conn = null;
  private Statement stm = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;
  private ResultSetMetaData rsmd = null;

  private String open() {
    String message = "Opened";
    try {
      Class.forName(driver); // load driver
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
    } catch (ClassNotFoundException | SQLException e) {
      message = e.getMessage();
    }
    return message;
  }

  private String close() {
    String message = "Closed";
    try {
      stm.close();
      conn.close();
    } catch (SQLException e) {
      message = e.getMessage();
    }
    return message;
  }

  public String insertData(String sql) {
    String message = open();
    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        message = close();
      } catch (SQLException e) {
        message = e.getMessage();
      }
    }
    return message;
  }
  
  public String getProperties(){
      String query = "SELECT properties.Nickname, address.`House Number`, address.`Street Name`, address.`Street Suffix`, address.City, address.State, address.`Zip Code`, properties.Floors FROM properties JOIN address ON properties.`House ID` = address.`House ID`";
      return resultSetToJson(query);
  }
  
  public String resultSetToJson(String query) {
        List<Map<String, Object>> listOfMaps = null;
        String message = open();
        if (message.equals("Opened")) {
            try {
                QueryRunner queryRunner = new QueryRunner();
                listOfMaps = queryRunner.query(conn, query, new MapListHandler());
            } catch (SQLException se) {
                throw new RuntimeException("Couldn't query the database.", se);
            } finally {
                DbUtils.closeQuietly(conn);
            }
        }
        return new Gson().toJson(listOfMaps);
    }
  
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
      } catch (SQLException e) {
        result += e.getMessage();
      }
      close();
      return result;
    } else {
      result += message;
      return result;
    }
  }
}
