package objetos;

import java.sql.*;


public class Conexion {
    public Connection getConexion(){
        Connection cn =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost/proyecto", "root", "");
        }catch(ClassNotFoundException | SQLException ex){}
        return cn;
    }
}
