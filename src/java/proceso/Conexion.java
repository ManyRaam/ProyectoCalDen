package proceso;

import java.sql.*;


public class Conexion {
    var con = new var();
    private final String nombreDriver = "com.mysql.jdbc.Driver";
	private final String nombreBd = "jdbc:mysql://localhost:3306/dentista";
	private final String nombreUserDb = "root";
	private final String passUserDb = con.getContraseña();

	
	public Connection obtenerConexion() {
	 	Connection result = null;
	    try {
	       Class.forName(nombreDriver);
	       result = DriverManager.getConnection(nombreBd, nombreUserDb, passUserDb);
               System.out.println("Conexion hecha: " + nombreDriver);
	     }
		catch (Exception ex) {
	        System.out.println("Error en clase CONEXION.class, Driver: " + nombreDriver);
		}
	     return result;
	}
    
}
