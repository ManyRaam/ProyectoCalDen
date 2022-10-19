package proceso;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
  import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Carlos vera
 */
public class usuario {
    private String user;
        private int cve_usuario;
	private String nombre;
	private String apellidop;
        private String apellidom;
	private String nickname;
	private String contrsena;
        private String curp;
        private String deporte;
	private int privilegio;
    private Object request;
     private String password;
    private String url;
    private String driver;
    private String dbname;
    private String usuarioo;
    private Connection connection;
    private String id;
  
        
    private String clvdoc;
    private String clvpac ; 
    private String correo;
    
    
    
    
    
     private int cve_usuarioo;
     
     
public void setclvpac(String clave) {
    clvpac= clave; 
}
public String getclvpac(){
    return clvpac;
}
	/** Crea un nueva instancia de la clase usuario con magia de sirenas y duendes*/
	public usuario(){

	}
        
            
     /**
     * Metodo usado para verificar si un usuario esta registrado en la Base de Datos
     * con su User y Clave de forma correcta
     * @param user Que viene a ser el user del Usuario
     * @param clave Que viene a ser la clave del Usuario
     */
        
         var con = new var( );
   public usuario VerificacionAlum(String usua, String contra) throws NoSuchAlgorithmException, InvalidKeyException, InvalidKeyException, NoSuchPaddingException, NoSuchPaddingException, IllegalBlockSizeException, IllegalBlockSizeException, IllegalBlockSizeException, IllegalBlockSizeException, IllegalBlockSizeException, BadPaddingException, IllegalBlockSizeException, IllegalBlockSizeException, BadPaddingException{
         usuario u=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            
            	 cn=c.getConexion();
                String sql="select aes_decrypt(unhex(paciente.usuario),'alksdfj902uj40jr0qj'), paciente.clvdoc,paciente.clvpac, aes_decrypt(unhex(paciente.contrasena),'alksdfj902uj40jr0qj') from paciente where aes_decrypt(unhex(paciente.usuario),'alksdfj902uj40jr0qj')=? AND aes_decrypt(unhex(paciente.contrasena),'alksdfj902uj40jr0qj')=?";
            System.out.println(sql);
            
            
            pr=cn.prepareStatement(sql);
            pr.setString(1, usua);
            pr.setString(2, contra);
            
            
            
            rs=pr.executeQuery();
             
              Data objConn = new Data( );
              
              
            while(rs.next()){
             u=new usuario();
             AES  j = new AES();
              u.setUser(j.encriptar(rs.getString("aes_decrypt(unhex(paciente.usuario),'alksdfj902uj40jr0qj')")));
                
              String algo = rs.getInt("clvdoc") + "";
              System.out.println(algo);
              String algo2 = rs.getInt("clvpac") + "" ; 
              
                System.out.println(j.encriptar(algo));
                u.setClvdoc(j.encriptar(algo));
                u.setclvpac(j.encriptar(algo2));
          
              
                       
              u.setcontrsena(j.encriptar(rs.getString("aes_decrypt(unhex(paciente.contrasena),'alksdfj902uj40jr0qj')")));
               
            
                System.out.println("varificacion usuario::: correcta");
                break;
            }
           
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
        } catch (IllegalBlockSizeException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadPaddingException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            try{
                rs.close();
                pr.close();
               
            }catch(SQLException ex){
                
            }
            
      
        }
        return u;
   }
        
    public usuario verificarUsuario(String user, String clave) throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
        usuario u=null;
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            
            	 cn=c.getConexion();
            String sql="select aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj'), doctor.clvdoc, aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj') from doctor where aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')=? AND aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj')=?";
            System.out.println(sql);
            
            
            pr=cn.prepareStatement(sql);
            pr.setString(1, user);
            pr.setString(2, clave);
            
            
            
            rs=pr.executeQuery();
             
              Data objConn = new Data( );
              
              
            while(rs.next()){
             u=new usuario();
             AES  j = new AES();
              u.setUser(j.encriptar(rs.getString("aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')")));
                
              String algo = rs.getInt("clvdoc") + "";
              System.out.println(algo);
              
              
                System.out.println(j.encriptar(algo));
                u.setClvdoc(j.encriptar(algo));
          
              
                       
              u.setcontrsena(j.encriptar(rs.getString("aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj')")));
               
            
                System.out.println("varificacion usuario::: correcta");
                break;
            }
           
        }catch(SQLException ex){
            ex.printStackTrace();
            u=null;
        } finally{
            try{
                rs.close();
                pr.close();
               
            }catch(SQLException ex){
                
            }
            
      
        }
        return u;
    }

    
    
    
    public void pad() throws NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException{
        Connection cn=null;
        PreparedStatement pr=null;
        ResultSet rs=null;
        try{
            
            	 cn=c.getConexion();
            String sql="set @@global.block_encryption_mode='aes-256-ecb'";
             pr=cn.prepareStatement(sql);
            rs=pr.executeQuery();
           
        }catch(SQLException ex){
            ex.printStackTrace();
           
        } finally{
            try{
                rs.close();
                pr.close();
               
            }catch(SQLException ex){
                
            }
            
      
        }
       
    }
    
    
    
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getClvdoc() {
        return clvdoc;
    }

    public void setClvdoc(String clvdoc) {
        this.clvdoc = clvdoc;
    }
	public int getcve_usuario(){
		 return this.cve_usuario;
	}
	public String getnombre(){
		 return this.nombre;
	}
	public String getapellidop(){
		 return this.apellidop;
	}
        public String getapellidom(){
		 return this.apellidom;
	}
	public String getnickname(){
		 return this.nickname;
	}
	public String getcontrsena(){
		 return this.contrsena;
	}
        public String getcurp(){
		 return this.curp;
	}
         public String getdeporte(){
		 return this.deporte;
	}
	public int getprivilegio(){
		 return this.privilegio;
	}

	/** Metodos SET de la clase usuario */

	public void setcve_usuario(int cve_usuario){
		 this.cve_usuario=cve_usuario;
	}
	public void setnombre(String nombre){
		 this.nombre=nombre;
	}
	public void setapellidop(String apellidop){
		 this.apellidop=apellidop;
	}
        public void setapellidom(String apellidom){
		 this.apellidom=apellidom;
	}
	public void setnickname(String nickname){
		 this.nickname=nickname;
	}
	public void setcontrsena(String contrsena){
		 this.contrsena=contrsena;
	}
        public void setcurp(String curp){
		 this.curp=curp;
	}
        
        public void setdeporte(String deporte){
		 this.deporte=deporte;
	}
	public void setprivilegio(int privilegio){
		 this.privilegio=privilegio;
	}

    public int getCve_usuario() {
        return cve_usuario;
    }

    public void setCve_usuario(int cve_usuario) {
        this.cve_usuario = cve_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidop() {
        return apellidop;
    }

    public void setApellidop(String apellidop) {
        this.apellidop = apellidop;
    }

    public String getApellidom() {
        return apellidom;
    }

    public void setApellidom(String apellidom) {
        this.apellidom = apellidom;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getContrsena() {
        return contrsena;
    }

    public void setContrsena(String contrsena) {
        this.contrsena = contrsena;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getDeporte() {
        return deporte;
    }

    public void setDeporte(String deporte) {
        this.deporte = deporte;
    }

    public int getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(int privilegio) {
        this.privilegio = privilegio;
    }

    public Object getRequest() {
        return request;
    }

    public void setRequest(Object request) {
        this.request = request;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getDbname() {
        return dbname;
    }

    public void setDbname(String dbname) {
        this.dbname = dbname;
    }

    public String getUsuarioo() {
        return usuarioo;
    }

    public void setUsuarioo(String usuarioo) {
        this.usuarioo = usuarioo;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCve_usuarioo() {
        return cve_usuarioo;
    }

    public void setCve_usuarioo(int cve_usuarioo) {
        this.cve_usuarioo = cve_usuarioo;
    }

    public var getCon() {
        return con;
    }

    public void setCon(var con) {
        this.con = con;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
        
        
        
}
