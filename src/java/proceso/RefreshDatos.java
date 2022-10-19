package proceso;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Niños Roman
 */
public class RefreshDatos {
    private Statement state;
    Conexion conecta= new Conexion(); 
    
    public ArrayList<Alumnos> buscar(int clave) throws Exception 
    {
        
                Connection conexion= conecta.obtenerConexion();                
                state= conexion.createStatement();
                ArrayList<Alumnos> alumnos= new ArrayList<Alumnos>();
                ResultSet rs = state.executeQuery("SELECT * FROM ALUMNOS WHERE CLAVE="+clave+")");
                while(rs.next())
                {
                    Alumnos alumno = new Alumnos();
                    alumno.setClave((Integer) rs.getObject(1));
                    alumno.setNombreAlumno((String) rs.getObject(2));
                    alumno.setBoleta((String) rs.getObject(3));
                    alumnos.add(alumno);
                }
                conexion.close();
    return alumnos;                 
    } 
    
    public ArrayList<Alumnos> listar() throws Exception 
    {
        
                Connection conexion= conecta.obtenerConexion();                
                state= conexion.createStatement();
                ArrayList<Alumnos> alumnos= new ArrayList<Alumnos>();
                ResultSet rs = state.executeQuery("SELECT * FROM ALUMNOS");
                while(rs.next())
                {
                    Alumnos alumno = new Alumnos();
                    alumno.setClave((Integer) rs.getObject(1));
                    alumno.setNombreAlumno((String) rs.getObject(2));
                    alumno.setBoleta((String) rs.getObject(3));
                    alumnos.add(alumno);
                }
    return alumnos;                 
    } 
    
}
