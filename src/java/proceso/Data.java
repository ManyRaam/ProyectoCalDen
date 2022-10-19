/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proceso;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author EDDIESON CORTES
 */
public class Data {

    private String password;
    private String url;
    private String driver;
    private String dbname;
    private String usuarioo;
    private Connection connection;
    private String id;
    private String nombre;
    private String user;
    private String celdas;
    private String tablas;
    private String logica;

    public Data(String password, String url, String driver, String dbname, String usuarioo, Connection connection, String id, String nombre, String user) {

        this.password = password;
        this.url = url;
        this.driver = driver;
        this.dbname = dbname;
        this.usuarioo = usuarioo;
        this.connection = connection;
        this.id = id;
        this.nombre = nombre;
        this.user = user;
    }

    public ArrayList<usuario> Consultardocs() throws SQLException, NoSuchAlgorithmException, InvalidKeyException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
        Statement statement = connection.createStatement();
        AES j = new AES();
        ArrayList<usuario> doctores = new ArrayList<usuario>();
        ResultSet resultSet = statement.executeQuery("select aes_decrypt(unhex(doctor.nombre),'alksdfj902uj40jr0qj'), aes_decrypt(unhex(doctor.apellidopa),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(doctor.apellidoma),'alksdfj902uj40jr0qj'),clvdoc from doctor");
        while (resultSet.next()) {
            usuario u = new usuario();
            u.setNombre(resultSet.getString("aes_decrypt(unhex(doctor.nombre),'alksdfj902uj40jr0qj')"));
            u.setApellidom(resultSet.getString("aes_decrypt(unhex(doctor.apellidoma),'alksdfj902uj40jr0qj')"));
            u.setApellidop(resultSet.getString("aes_decrypt(unhex(doctor.apellidopa),'alksdfj902uj40jr0qj')"));
            u.setClvdoc(j.encriptar(String.valueOf(resultSet.getInt("clvdoc"))));

            doctores.add(u);

        }

        return doctores;
    }

    public void open() {
        try {
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Se ha conectado");
            System.out.println(connection.isClosed());
        } catch (Exception ex) {

            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No se ha conectado");
        }

    }

    public void insertF(var objvar) {
        StringBuilder stringBuilder = null;
        try {

            stringBuilder = new StringBuilder();
            stringBuilder.append("insert into paciente (nombre,boleta,edad,sexo) values('");
            stringBuilder.append(objvar.getNombre());
            stringBuilder.append("', '");
            stringBuilder.append(objvar.getBoleta());
            stringBuilder.append("' , '");
            stringBuilder.append(objvar.getEdad());
            stringBuilder.append("' , '");
            stringBuilder.append(objvar.getSexo());

            stringBuilder.append("' )");

            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());

        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertarsolicitud(Object[] datos) throws SQLException {

        String orden = "insert into solicitudcita(comentario,clvpac,clvdoc,fecha) values ( '" + datos[0] + "','" + datos[1] + "','" + datos[2] + "','" + datos[3] + "')";
        Statement statement = connection.createStatement();
        statement.execute(orden);

    }

    public void modificar(String usuario, String nombre, String ap, String am, int clvdoc) throws SQLException {
        String update = "update doctor  set password = hex(Aes_encrypt('" + usuario + "','alksdfj902uj40jr0qj')),nombre =hex(Aes_encrypt('" + nombre + "','alksdfj902uj40jr0qj'))" + ",apellidopa=hex(Aes_encrypt('" + ap + "','alksdfj902uj40jr0qj')),apellidoma=hex(Aes_encrypt('" + am + "','alksdfj902uj40jr0qj')) where clvdoc =" + clvdoc;
        Statement statement = connection.createStatement();
        statement.execute(update);

    }

    public boolean verificar(String usuario) throws SQLException {
        boolean validado = true;

        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery("select aes_decrypt(unhex(paciente.usuario),'alksdfj902uj40jr0qj') from paciente where aes_decrypt(unhex(paciente.usuario),'alksdfj902uj40jr0qj') ='" + usuario + "'");
        if (rs.next()) {
            validado = false;

        }

        return validado;
    }

    public void insertardatos(Object[] datos, int CARLITOSPUTO) throws SQLException {
        StringBuilder stringBuilder = null;

        if (CARLITOSPUTO == 1) {
            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarPaciente1('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: paciente");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

            //////////////////////////////////////
        } else if (CARLITOSPUTO == 2) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call InsertarAlumno('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: alumno");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("ya fue");
            }

            //////////////////////////////////
        } else if (CARLITOSPUTO == 3) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarDirecto('" + datos[1] + "','" + datos[0] + "')");

                System.out.println(stringBuilder.toString());

                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: directo");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

            ////////////////
        } else if (CARLITOSPUTO == 4) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarHistorial('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: historial");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

            /////////
        } else if (CARLITOSPUTO == 5) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarEnf('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: enfermedades");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (CARLITOSPUTO == 6) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarDentadura('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: dentadura");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }
            //////
        } else if (CARLITOSPUTO == 7) {
            ResultSet rs;
            Statement st = connection.createStatement();
            rs = st.executeQuery("select if('" + datos[3] + "'>curdate(), 1,2 ) as respuesta");
            rs.next();
            int uno = rs.getInt("respuesta");
            st = connection.createStatement();
            rs = st.executeQuery("select clvdoc,fecha from cita where clvdoc = " + datos[0] + " and fecha = '" + datos[3] + "'");
            if ((!rs.next()) && (uno == 1)) {
                try {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("call insertarCita('" + datos[0] + "'");

                    for (int i = 1; i <= datos.length; i++) {
                        if (i < datos.length) {
                            //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                            stringBuilder.append(",'" + datos[i] + "'");

                        } else {
                            stringBuilder.append(")");
                        }

                    }
                    Statement statement = connection.createStatement();
                    statement.execute(stringBuilder.toString());
                    System.out.println("todo bien el la tabla: dentadura");
                } catch (Exception ex) {
                    Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

        } else if (CARLITOSPUTO == 8) {
            ResultSet rs;
            Statement st = connection.createStatement();
            rs = st.executeQuery("select if('" + datos[2] + "'>curdate(), 1,2 ) as respuesta");
            rs.next();
            int uno = rs.getInt("respuesta");
            st = connection.createStatement();
            rs = st.executeQuery("select clvdoc,fecha from cita where clvdoc = " + datos[0] + " and fecha = '" + datos[2] + "'");
            if ((!rs.next()) && (uno == 1)) {
                try {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("insert into cita(clvdoc,claveproc,fecha ) values ('" + datos[0] + "'");

                    for (int i = 1; i <= datos.length; i++) {
                        if (i < datos.length) {
                            //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                            stringBuilder.append(",'" + datos[i] + "'");

                        } else {
                            stringBuilder.append(")");
                        }

                    }
                    Statement statement = connection.createStatement();
                    statement.execute(stringBuilder.toString());
                    System.out.println("todo bien el la tabla: dentadura");
                } catch (Exception ex) {
                    Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } else if (CARLITOSPUTO == 13) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarPaciente2('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: dentadura");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (CARLITOSPUTO == 12) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarDirect1('" + datos[0] + "'");

                for (int i = 1; i <= datos.length; i++) {
                    if (i < datos.length) {
                        //  System.out.println("valores:::::::::"+datos[i]+datos[0]);
                        stringBuilder.append(",'" + datos[i] + "'");

                    } else {
                        stringBuilder.append(")");
                    }

                }

                System.out.println(stringBuilder.toString());
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: dentadura");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (CARLITOSPUTO == 20) {

            try {
                stringBuilder = new StringBuilder();
                stringBuilder.append("call insertarDocente2('" + datos[1] + "','" + datos[0] + "')");

                System.out.println("cosaaaaa::::" + stringBuilder.toString());
                Statement statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
                System.out.println("todo bien el la tabla: dentadura");
            } catch (Exception ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        /////////
    }

    public void insertCit(var objvar) {
        StringBuilder stringBuilder = null;
        try {
            stringBuilder = new StringBuilder();
            //   stringBuilder.append("START TRANSACTION;");

            //   stringBuilder.append( "insert into procedimientos (nombreproc) values('" );
            //     stringBuilder.append( objvar.getProcedimiento());
            //    stringBuilder.append( "' )" );
            //    String fecha =  String.valueOf(objvar.getAño()+"-"+objvar.getMes()+"-"+objvar.getDia());
            //   System.out.println("fecha :" + fecha);
            //    System.out.println("clv:"+objvar.getClvpac());
            stringBuilder.append("insert into cita (fecha,clvpac,pro) values('");
            stringBuilder.append(objvar.getAño() + "-" + objvar.getMes() + "-" + objvar.getDia() + " " + objvar.getHora());
            stringBuilder.append("', '");
            stringBuilder.append(objvar.getClvpac());
            stringBuilder.append("' , '");
            stringBuilder.append(objvar.getProcedimiento());

            stringBuilder.append("' )");
            //             stringBuilder.append("COMMIT;");
            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private final String nom = "aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')";
    private final String pat = "aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')";
    private final String mat = "aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')";
    private final String bol = "aes_decrypt(unhex(alumno.boleta),'alksdfj902uj40jr0qj')";

    public void InsertDent(String nombre, String apellidopa, String apellidoma, int edad, String correo, String usuario, String contra, String sexo) throws SQLException {
        StringBuilder stringBuilder = new StringBuilder();
        Statement statement = connection.createStatement();
        ResultSet rs = null;
        rs = statement.executeQuery("select aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj') from doctor where aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')='" + usuario + "'");
        if (!rs.next()) {

            stringBuilder.append("call registrarDoctor('" + usuario + "'" + ",'" + contra + "','" + correo + "','" + nombre + "', '" + apellidopa + "', '" + apellidoma + "', '" + sexo + "')");

            try {

                statement = connection.createStatement();
                statement.execute(stringBuilder.toString());
            } catch (SQLException ex) {
                Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            System.out.println("esta madre no quiere correr ");
        }

    }

    public List<var> selectAlum(String clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            //   
            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from alumnosVer where clvdoc = " + clvdoc);
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                objvar.setNombre(resultSet.getString(nom));
                objvar.setApellidom(resultSet.getString(mat));
                objvar.setApellidop(resultSet.getString(pat));
                objvar.setBoleta(resultSet.getString(bol));

                String s = resultSet.getString("sexo");
                char c = s.charAt(0);
                objvar.setSexo(c);
                objvar.setEdad(resultSet.getString("edad"));
                objvar.setClvpac(resultSet.getInt("clvpac"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selectDirec(String clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from directoVer where clvdoc=" + clvdoc);
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));

                String s = resultSet.getString("sexo");
                char c = s.charAt(0);
                objvar.setSexo(c);
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setEdad(resultSet.getString("edad"));
                objvar.setArea(resultSet.getString("area"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selecDocente(String clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from verDocentes where clvdoc= " + clvdoc);
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));

                String s = resultSet.getString("sexo");
                char c = s.charAt(0);
                objvar.setSexo(c);
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setEdad(resultSet.getString("edad"));
                objvar.setArea(resultSet.getString("area"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selectExt(String clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from extVer where clvdoc= " + clvdoc);
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                String s = resultSet.getString("sexo");
                char c = s.charAt(0);
                objvar.setSexo(c);
                objvar.setEdad(resultSet.getString("edad"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> last() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from last;");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setEndclvpac(resultSet.getInt("clvpac"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> Sesion(int clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from sesion where clvdoc = " + clvdoc);
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setUsuario(resultSet.getString("aes_decrypt(unhex(doctor.usuario),'alksdfj902uj40jr0qj')"));
                objvar.setCorreo(resultSet.getString("aes_decrypt(unhex(doctor.correo),'alksdfj902uj40jr0qj')"));
                objvar.setPassword(resultSet.getString("aes_decrypt(unhex(doctor.password),'alksdfj902uj40jr0qj')"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(doctor.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(doctor.apellidopa),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(doctor.apellidoma),'alksdfj902uj40jr0qj')"));
                objvar.setSexoo(resultSet.getString("sexo"));
                int color = resultSet.getInt("tema");
                objvar.setParticulas(resultSet.getString("particulas"));

                if (color == 1) {

                    objvar.setFondo("#252A34");
                    objvar.setFondoB("#781342");
                    objvar.setBarra("#FF2E63");
                }
                if (color == 2) {

                    objvar.setFondo("#252A34");
                    objvar.setFondoB("#252A34");
                    objvar.setBarra("#FF2E63");
                }
                if (color == 3) {

                    objvar.setFondo("#522546");
                    objvar.setFondoB("#522546");
                    objvar.setBarra("#E23E57");
                }
                if (color == 4) {

                    objvar.setFondo("#FED8A7");
                    objvar.setFondoB("#FED8A7");
                    objvar.setBarra("#C9707C");
                }
                if (color == 5) {

                    objvar.setFondo("#F38181");
                    objvar.setFondoB("#F38181");
                    objvar.setBarra("#FCE38A");
                }
                if (color == 6) {

                    objvar.setFondo("#3EC1D3");
                    objvar.setFondoB("#3EC1D3");
                    objvar.setBarra("#F6F7D7");
                }
                if (color == 7) {

                    objvar.setFondo("#FFF8E7");
                    objvar.setFondoB("#FFF8E7");
                    objvar.setBarra("#F4A460");
                }
                if (color == 8) {

                    objvar.setFondo("#10DDC2");
                    objvar.setFondoB("#10DDC2");
                    objvar.setBarra("#F5F5F5");
                }
                if (color == 9) {

                    objvar.setFondo("#FF89C0");
                    objvar.setFondoB("#FF89C0");
                    objvar.setBarra("#6DF1CC");
                }
                if (color == 10) {

                    objvar.setFondo("#AA96DA");
                    objvar.setFondoB("#AA96DA");
                    objvar.setBarra("#A8D8EA");
                }
                if (color == 11) {

                    objvar.setFondo("#C61951");
                    objvar.setFondoB("#C61951");
                    objvar.setBarra("#56132A");
                }

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selectCaleaftertoday(int clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select distinct  fecha from cita where clvdoc= '"
                    + clvdoc + "' AND fecha>curdate()");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                String Fecha = (resultSet.getString("cita.fecha"));
                String Año = Fecha.substring(0, 4);
                String Mes = Fecha.substring(5, 7);
                String Dia = Fecha.substring(8, 10);
                String hora = Fecha.substring(11, 19);
                String myTime = Fecha.substring(11, 16);

                SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                java.util.Date d = df.parse(myTime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 30);
                String newTime = df.format(cal.getTime());

                objvar.setFecha(Año + "-" + Mes + "-" + Dia + "T" + hora);

                objvar.setEnd(Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00");
                System.out.println("finHORA:" + Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00:00");

                objvar.setColor("#000080");

                objvar.setProcedimiento("Ocupado");

                //  String s= resultSet.getString("sexo");
                //   char c = s.charAt(0);
                // objvar.setSexo(c);
                // objvar.setEdad(resultSet.getInt("edad") );
                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selectOcupado(int clvdoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select distinct  fecha from cita where clvdoc= '"
                    + clvdoc + "'  and claveproc=11");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                String Fecha = (resultSet.getString("cita.fecha"));
                String Año = Fecha.substring(0, 4);
                String Mes = Fecha.substring(5, 7);
                String Dia = Fecha.substring(8, 10);
                String hora = Fecha.substring(11, 19);
                String myTime = Fecha.substring(11, 16);

                SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                java.util.Date d = df.parse(myTime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 30);
                String newTime = df.format(cal.getTime());

                objvar.setFecha(Año + "-" + Mes + "-" + Dia + "T" + hora);

                objvar.setEnd(Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00");

                objvar.setColor("#000080");

                objvar.setProcedimiento("Ocupado");

                //  String s= resultSet.getString("sexo");
                //   char c = s.charAt(0);
                // objvar.setSexo(c);
                // objvar.setEdad(resultSet.getInt("edad") );
                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selectCale(int claveDoc) {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select distinct aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'), paciente.clvpac, aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'), cita.fecha, procedimientos.nombreproc from cita, procedimientos, paciente "
                    + "where procedimientos.claveproc= cita.claveproc and paciente.clvdoc = cita.clvdoc and paciente.clvdoc = '" + claveDoc + "' AND paciente.clvpac=cita.clvpac");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                String Fecha = (resultSet.getString("cita.fecha"));

                String Año = Fecha.substring(0, 4);
                String Mes = Fecha.substring(5, 7);
                String Dia = Fecha.substring(8, 10);

                String hora = Fecha.substring(11, 19);
                String myTime = Fecha.substring(11, 16);

                SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                java.util.Date d = df.parse(myTime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 30);
                String newTime = df.format(cal.getTime());

                System.out.println("Dia:" + Dia);
                System.out.println("mes:" + Mes);
                System.out.println("año:" + Año);
                System.out.println("hora:" + hora);
                System.out.println("fin:" + newTime);

                objvar.setFecha(Año + "-" + Mes + "-" + Dia + "T" + hora);

                objvar.setEnd(Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00");
                System.out.println("finHORA:" + Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00:00");

                String pro = resultSet.getString("procedimientos.nombreproc");

                if (pro.equals("engodoncia")) {
                    objvar.setColor("#FF6347");
                }
                if (pro.equals("alergia")) {
                    objvar.setColor("#FC85AE");
                }
                if (pro.equals("DX")) {
                    objvar.setColor("#9E579D");
                }

                if (pro.equals("Ter.Cep")) {
                    objvar.setColor("#53354A");
                }
                if (pro.equals("Obtulacion")) {
                    objvar.setColor("#303A52");
                }
                if (pro.equals("Resina/Amalgama")) {
                    objvar.setColor("#252A34");
                }
                if (pro.equals("Extraccion")) {
                    objvar.setColor("#574B90");
                }
                if (pro.equals("Endodoncia")) {
                    objvar.setColor("#6A2C70");
                }

                if (pro.equals("Revision")) {
                    objvar.setColor("#FF0000");
                }

                if (pro.equals("Ocupado")) {
                    objvar.setColor("#000080");
                }

                objvar.setProcedimiento(resultSet.getString("procedimientos.nombreproc"));

                //  String s= resultSet.getString("sexo");
                //   char c = s.charAt(0);
                // objvar.setSexo(c);
                // objvar.setEdad(resultSet.getInt("edad") );
                objvar.setClvpac(resultSet.getInt("paciente.clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> selecReportes() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from selecReportes");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                String Fecha = (resultSet.getString("fecha"));

                String Año = Fecha.substring(0, 4);
                String Mes = Fecha.substring(5, 7);
                String Dia = Fecha.substring(8, 10);

                String hora = Fecha.substring(11, 19);
                String myTime = Fecha.substring(11, 16);

                SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                java.util.Date d = df.parse(myTime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 30);
                String newTime = df.format(cal.getTime());

                System.out.println("Dia:" + Dia);
                System.out.println("mes:" + Mes);
                System.out.println("año:" + Año);
                System.out.println("hora:" + hora);
                System.out.println("fin:" + newTime);

                objvar.setFecha(Año + "-" + Mes + "-" + Dia + "T" + hora);

                objvar.setEnd(Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00");
                System.out.println("finHORA:" + Año + "-" + Mes + "-" + Dia + "T" + newTime + ":00:00");

                objvar.setProcedimiento(resultSet.getString("nombreproc"));

                //  String s= resultSet.getString("sexo");
                //   char c = s.charAt(0);
                // objvar.setSexo(c);
                // objvar.setEdad(resultSet.getInt("edad") );
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelectHisDisponibilidad() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;

            ResultSet resultSet = statement.executeQuery("select historia.clavhis from historia where clvpac=" + con.getId());
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setClvHist(resultSet.getInt("clavhis"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> DatosReporteAl() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;
            DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            //   System.out.println("fechaDD::::::"+fecha.format(cal.getTime()));
            //  System.out.println("fechaDD2::::::"+fecha2.format(cal.getTime()));
            ResultSet resultSet = statement.executeQuery("select procedimientos.nombreproc, cita.fecha, cita.clvpac,aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj'),paciente.tipo,paciente.edad,paciente.sexo,aes_decrypt(unhex(alumno.boleta),'alksdfj902uj40jr0qj'),alumno.semestre from cita,procedimientos,paciente,alumno where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = alumno.clvpac and paciente.tipo=1 and cita.fecha between '" + fecha2.format(cal.getTime()) + "' and '" + fecha2.format(cal.getTime()) + " 23:59:59'");
            // ResultSet resultSet =  statement.executeQuery( "select procedimientos.nombreproc, cita.fecha, cita.clvpac,paciente.nombre,paciente.apellidop,paciente.apellidom,paciente.tipo,paciente.edad,paciente.sexo,alumno.boleta,alumno.semestre from cita,procedimientos,paciente,alumno where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = alumno.clvpac and paciente.tipo=1 and cita.fecha between '2016-11-09' and '2016-11-09 23:59:59'");

            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setNombreProcM(resultSet.getString("nombreproc"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));
                objvar.setTipo(resultSet.getInt("tipo"));
                objvar.setEdad(resultSet.getString("edad"));
                objvar.setSexoo(resultSet.getString("sexo"));
                objvar.setBoleta(resultSet.getString("aes_decrypt(unhex(alumno.boleta),'alksdfj902uj40jr0qj')"));
                objvar.setSemestre(resultSet.getInt("semestre"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> DatosReporteDir() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;
            DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            //   System.out.println("fechaDD::::::"+fecha.format(cal.getTime()));
            //  System.out.println("fechaDD2::::::"+fecha2.format(cal.getTime()));
            ResultSet resultSet = statement.executeQuery("select procedimientos.nombreproc, cita.fecha, cita.clvpac,aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj'),paciente.tipo,paciente.edad,paciente.sexo,directo.area from cita,procedimientos,paciente,directo where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = directo.clvpac and cita.fecha between '" + fecha2.format(cal.getTime()) + "' and '" + fecha2.format(cal.getTime()) + " 23:59:59'");
            // ResultSet resultSet =  statement.executeQuery( "select procedimientos.nombreproc, cita.fecha, cita.clvpac,paciente.nombre,paciente.apellidop,paciente.apellidom,paciente.tipo,paciente.edad,paciente.sexo,alumno.boleta,alumno.semestre from cita,procedimientos,paciente,alumno where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = alumno.clvpac and paciente.tipo=1 and cita.fecha between '2016-11-09' and '2016-11-09 23:59:59'");

            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setNombreProcM(resultSet.getString("nombreproc"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));

                objvar.setEdad(resultSet.getString("edad"));
                objvar.setSexoo(resultSet.getString("sexo"));
                objvar.setArea(resultSet.getString("area"));

                System.out.println("ECHO");

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> DatosReporteDoc() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;
            DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            //   System.out.println("fechaDD::::::"+fecha.format(cal.getTime()));
            //  System.out.println("fechaDD2::::::"+fecha2.format(cal.getTime()));
            ResultSet resultSet = statement.executeQuery("select procedimientos.nombreproc, cita.fecha, cita.clvpac,aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj'),paciente.tipo,paciente.edad,paciente.sexo,docente.area from cita,procedimientos,paciente,docente where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = docente.clvpac and cita.fecha between '" + fecha2.format(cal.getTime()) + "' and '" + fecha2.format(cal.getTime()) + " 23:59:59'");
            // ResultSet resultSet =  statement.executeQuery( "select procedimientos.nombreproc, cita.fecha, cita.clvpac,paciente.nombre,paciente.apellidop,paciente.apellidom,paciente.tipo,paciente.edad,paciente.sexo,alumno.boleta,alumno.semestre from cita,procedimientos,paciente,alumno where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = alumno.clvpac and paciente.tipo=1 and cita.fecha between '2016-11-09' and '2016-11-09 23:59:59'");

            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setNombreProcM(resultSet.getString("nombreproc"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));

                objvar.setEdad(resultSet.getString("edad"));
                objvar.setSexoo(resultSet.getString("sexo"));
                objvar.setArea(resultSet.getString("area"));

                System.out.println("ECHO");

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> DatosReporteE() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;
            DateFormat fecha = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            //   System.out.println("fechaDD::::::"+fecha.format(cal.getTime()));
            //  System.out.println("fechaDD2::::::"+fecha2.format(cal.getTime()));
            ResultSet resultSet = statement.executeQuery("select procedimientos.nombreproc, cita.fecha, cita.clvpac,aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'),aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj'),paciente.tipo,paciente.edad,paciente.sexo from cita,procedimientos,paciente where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.tipo=2 and  cita.fecha between '" + fecha2.format(cal.getTime()) + "' and '" + fecha2.format(cal.getTime()) + " 23:59:59'");
            // ResultSet resultSet =  statement.executeQuery( "select procedimientos.nombreproc, cita.fecha, cita.clvpac,paciente.nombre,paciente.apellidop,paciente.apellidom,paciente.tipo,paciente.edad,paciente.sexo,alumno.boleta,alumno.semestre from cita,procedimientos,paciente,alumno where cita.claveproc = procedimientos.claveproc AND cita.clvpac = paciente.clvpac and paciente.clvpac = alumno.clvpac and paciente.tipo=1 and cita.fecha between '2016-11-09' and '2016-11-09 23:59:59'");

            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setNombreProcM(resultSet.getString("nombreproc"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                objvar.setApellidom(resultSet.getString("aes_decrypt(unhex(paciente.apellidom),'alksdfj902uj40jr0qj')"));
                objvar.setTipo(resultSet.getInt("tipo"));
                objvar.setEdad(resultSet.getString("edad"));
                objvar.setSexoo(resultSet.getString("sexo"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelectEnf() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;

            ResultSet resultSet = statement.executeQuery("select enfermedad.nombre from enfermedad,enfpac where enfpac.clvpac =" + getId() + " and enfermedad.claveenf = enfpac.claveenf");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setNombrenf(resultSet.getString("nombre"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelectSoli() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();

            var objvar = null;
            System.out.println("clave paciente data:::::::::" + getId());
            ResultSet resultSet = statement.executeQuery("select fecha,estado,clvpac,comentario from solicitudcita where clvpac=" + getId());
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setRazon(resultSet.getString("comentario"));
                objvar.setEstado(resultSet.getInt("estado"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public void RechazarSoli(int id2) throws SQLException {
        Statement statement = connection.createStatement();
        statement.execute("update solicitudcita set estado=2 where id =" + id2);

    }

    public void AceptarSoli(String fecha, String proc, int clvdoc, int clvpac) throws SQLException {

        Object[] cita = new Object[4];
        cita[0] = clvdoc;
        cita[1] = clvpac;
        cita[2] = 10;
        cita[3] = fecha;
        insertardatos(cita, 7);

    }

    public List<var> SelectSoli2() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select distinct aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj'), paciente.clvpac, aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj'), cita.fecha, procedimientos.nombreproc from cita, procedimientos, paciente "
                    + "where procedimientos.claveproc= cita.claveproc and paciente.clvdoc = cita.clvdoc and paciente.clvdoc = '" + getId() + "' AND paciente.clvpac=cita.clvpac and cita.fecha>=curdate()");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();
                //     objvar.setCve_usuario( Integer.valueOf( resultSet.getInt( 1 ) ) );
                String Fecha = (resultSet.getString("cita.fecha"));

                String Año = Fecha.substring(0, 4);
                String Mes = Fecha.substring(5, 7);
                String Dia = Fecha.substring(8, 10);

                String hora = Fecha.substring(11, 19);
                String myTime = Fecha.substring(11, 16);

                SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                java.util.Date d = df.parse(myTime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, 30);
                String newTime = df.format(cal.getTime());

                System.out.println("Dia:" + Dia);
                System.out.println("mes:" + Mes);
                System.out.println("año:" + Año);
                System.out.println("hora:" + hora);
                System.out.println("fin:" + newTime);

                objvar.setFecha(Dia + "-" + Mes + "-" + Año + " " + hora);

                String pro = resultSet.getString("procedimientos.nombreproc");

                if (pro.equals("engodoncia")) {
                    objvar.setColor("#FF6347");
                }
                if (pro.equals("alergia")) {
                    objvar.setColor("#FC85AE");
                }
                if (pro.equals("DX")) {
                    objvar.setColor("#9E579D");
                }

                if (pro.equals("Ter.Cep")) {
                    objvar.setColor("#53354A");
                }
                if (pro.equals("Obtulacion")) {
                    objvar.setColor("#303A52");
                }
                if (pro.equals("Resina/Amalgama")) {
                    objvar.setColor("#252A34");
                }
                if (pro.equals("Extraccion")) {
                    objvar.setColor("#574B90");
                }
                if (pro.equals("Endodoncia")) {
                    objvar.setColor("#6A2C70");
                }

                if (pro.equals("Revision")) {
                    objvar.setColor("#FF0000");
                }

                if (pro.equals("Ocupado")) {
                    objvar.setColor("#000080");
                }

                objvar.setProcedimiento(resultSet.getString("procedimientos.nombreproc"));

                //  String s= resultSet.getString("sexo");
                //   char c = s.charAt(0);
                // objvar.setSexo(c);
                // objvar.setEdad(resultSet.getInt("edad") );
                objvar.setClvpac(resultSet.getInt("paciente.clvpac"));
                objvar.setNombre(resultSet.getString("aes_decrypt(unhex(paciente.nombre),'alksdfj902uj40jr0qj')"));
                objvar.setApellidop(resultSet.getString("aes_decrypt(unhex(paciente.apellidop),'alksdfj902uj40jr0qj')"));
                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelectCitaUsuario() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();
            var con = new var();
            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select cita.claveproc,cita.fecha,procedimientos.nombreproc,cita.clvpac from procedimientos,cita where procedimientos.claveproc=cita.claveproc and cita.clvpac=" + getId());
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                objvar.setClvproc(resultSet.getInt("claveproc"));
                objvar.setClvpac(resultSet.getInt("clvpac"));
                objvar.setFecha(resultSet.getString("fecha"));
                objvar.setNombreProcM(resultSet.getString("nombreproc"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public var SelctHist() {
        var objvar = null;
        try {
            Statement statement = connection.createStatement();

            ResultSet resultSet = statement.executeQuery("select alergias,descenfer,anestesia,comanes,enfermedad from historia  where historia.clvpac ="
                    + getId());
            while (resultSet.next()) {

                objvar = new var();

                objvar.setAlergias(resultSet.getString("alergias"));
                objvar.setDesEnf(resultSet.getString("descenfer"));
                objvar.setAnestesia(resultSet.getString("anestesia"));
                objvar.setComenAnestesia(resultSet.getString("comanes"));

                objvar.setEnfermedades(resultSet.getString("enfermedad"));

                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return objvar;

    }

    public List<var> SelctDentadura1() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from dentadura where clvpac=" + getId() + " and tipo between 11 and 18");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                String c = resultSet.getString("dientecondicion");
                if (c.equals(" ")) {
                    objvar.setDientecondicion(" ");
                    objvar.setDc(" ");
                    objvar.setColor("4");
                }
                if (c.equals("Cariado")) {
                    objvar.setDientecondicion("C");
                    objvar.setColor("11");
                    objvar.setDc("Cariado");
                }
                if (c.equals("Perdido")) {
                    objvar.setDientecondicion("P");
                    objvar.setColor("8");
                    objvar.setDc("Perdido");
                }
                if (c.equals("Obturado")) {
                    objvar.setDientecondicion("O");
                    objvar.setColor("13");
                    objvar.setDc("Obturado");
                }

                int z = resultSet.getInt("tipo");

                if (z == 11) {
                    objvar.setX(400);
                    objvar.setY(0);
                }
                if (z == 12) {
                    objvar.setX(350);
                    objvar.setY(0);
                }
                if (z == 13) {
                    objvar.setX(315);
                    objvar.setY(0);
                }
                if (z == 14) {
                    objvar.setX(270);
                    objvar.setY(0);
                }
                if (z == 15) {
                    objvar.setX(230);
                    objvar.setY(0);
                }
                if (z == 16) {
                    objvar.setX(190);
                    objvar.setY(0);
                }
                if (z == 17) {
                    objvar.setX(130);
                    objvar.setY(0);
                }
                if (z == 18) {
                    objvar.setX(62);
                    objvar.setY(0);
                }

                objvar.setTipo(resultSet.getInt("tipo"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelctDentadura2() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from dentadura where clvpac=" + getId() + " and tipo between 21 and 28 order by tipo DESC");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                String c = resultSet.getString("dientecondicion");
                if (c.equals(" ")) {
                    objvar.setDientecondicion(" ");
                    objvar.setDc(" ");
                    objvar.setColor("4");
                }
                if (c.equals("Cariado")) {
                    objvar.setDientecondicion("C");
                    objvar.setColor("11");
                    objvar.setDc("Cariado");
                }
                if (c.equals("Perdido")) {
                    objvar.setDientecondicion("P");
                    objvar.setColor("8");
                    objvar.setDc("Perdido");
                }
                if (c.equals("Obturado")) {
                    objvar.setDientecondicion("O");
                    objvar.setColor("13");
                    objvar.setDc("Obturado");
                }

                int z = resultSet.getInt("tipo");

                if (z == 21) {
                    objvar.setX(450);
                    objvar.setY(0);
                }
                if (z == 22) {
                    objvar.setX(482);
                    objvar.setY(0);
                }
                if (z == 23) {
                    objvar.setX(525);
                    objvar.setY(0);
                }
                if (z == 24) {
                    objvar.setX(570);
                    objvar.setY(0);
                }
                if (z == 25) {
                    objvar.setX(610);
                    objvar.setY(0);
                }
                if (z == 26) {
                    objvar.setX(667);
                    objvar.setY(0);
                }
                if (z == 27) {
                    objvar.setX(730);
                    objvar.setY(0);
                }
                if (z == 28) {
                    objvar.setX(800);
                    objvar.setY(0);
                }
                objvar.setTipo(resultSet.getInt("tipo"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelctDentadura3() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from dentadura where clvpac=" + getId() + " and tipo between 31 and 38 order by tipo DESC");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                String c = resultSet.getString("dientecondicion");
                if (c.equals(" ")) {
                    objvar.setDientecondicion(" ");
                    objvar.setDc(" ");
                    objvar.setColor("4");
                }
                if (c.equals("Cariado")) {
                    objvar.setDientecondicion("C");
                    objvar.setColor("11");
                    objvar.setDc("Cariado");
                }
                if (c.equals("Perdido")) {
                    objvar.setDientecondicion("P");
                    objvar.setColor("8");
                    objvar.setDc("Perdido");
                }
                if (c.equals("Obturado")) {
                    objvar.setDientecondicion("O");
                    objvar.setColor("13");
                    objvar.setDc("Obturado");
                }

                int z = resultSet.getInt("tipo");

                if (z == 31) {
                    objvar.setX(450);
                    objvar.setY(125);
                }
                if (z == 32) {
                    objvar.setX(482);
                    objvar.setY(125);
                }
                if (z == 33) {
                    objvar.setX(525);
                    objvar.setY(125);
                }
                if (z == 34) {
                    objvar.setX(570);
                    objvar.setY(125);
                }
                if (z == 35) {
                    objvar.setX(611);
                    objvar.setY(125);
                }
                if (z == 36) {
                    objvar.setX(667);
                    objvar.setY(125);
                }
                if (z == 37) {
                    objvar.setX(730);
                    objvar.setY(125);
                }
                if (z == 38) {
                    objvar.setX(800);
                    objvar.setY(125);
                }

                objvar.setTipo(resultSet.getInt("tipo"));

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public List<var> SelctDentadura4() {
        List<var> list = null;
        try {
            Statement statement = connection.createStatement();

            var objvar = null;
            ResultSet resultSet = statement.executeQuery("select * from dentadura where clvpac=" + getId() + " and tipo between 41 and 48");
            while (resultSet.next()) {
                if (list == null) {
                    list = new ArrayList<var>();
                }
                objvar = new var();

                String c = resultSet.getString("dientecondicion");
                if (c.equals(" ")) {
                    objvar.setDientecondicion(" ");
                    objvar.setDc(" ");
                    objvar.setColor("4");
                }
                if (c.equals("Cariado")) {
                    objvar.setDientecondicion("C");
                    objvar.setColor("11");
                    objvar.setDc("Cariado");
                }
                if (c.equals("Perdido")) {
                    objvar.setDientecondicion("P");
                    objvar.setColor("8");
                    objvar.setDc("Perdido");
                }
                if (c.equals("Obturado")) {
                    objvar.setDientecondicion("O");
                    objvar.setColor("13");
                    objvar.setDc("Obturado");
                }

                objvar.setTipo(resultSet.getInt("tipo"));

                int z = resultSet.getInt("tipo");

                if (z == 41) {
                    objvar.setX(400);
                    objvar.setY(125);
                }
                if (z == 42) {
                    objvar.setX(350);
                    objvar.setY(125);
                }
                if (z == 43) {
                    objvar.setX(316);
                    objvar.setY(125);
                }
                if (z == 44) {
                    objvar.setX(270);
                    objvar.setY(125);
                }
                if (z == 45) {
                    objvar.setX(230);
                    objvar.setY(125);
                }
                if (z == 46) {
                    objvar.setX(191);
                    objvar.setY(125);
                }
                if (z == 47) {
                    objvar.setX(130);
                    objvar.setY(125);
                }
                if (z == 48) {
                    objvar.setX(67);
                    objvar.setY(125);
                }

                list.add(objvar);
                //System.out.println("buscando");
                //  System.out.println("usuario"+usuarioo);
            }
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("murio");
        }
        return list;

    }

    public void EliminarC(var objvar) {
        StringBuilder stringBuilder = null;
        try {
            stringBuilder = new StringBuilder();
            System.out.println("claveeeeeeee:" + objvar.getClvpac());  //Representa una cadena de caracteres modificable
            stringBuilder.append("delete from paciente WHERE clvpac=");//Anexa al final de la instancia una copia de la cadena especificada.
            stringBuilder.append(objvar.getClvpac());
            stringBuilder.append("");

            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());
            // statement.execute( "delete from tabladir  WHERE ID=1" );
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void EliminarCit(var objvar) {
        StringBuilder stringBuilder = null;
        try {
            stringBuilder = new StringBuilder();
            System.out.println("claveeeeeeee:" + objvar.getClvpac());  //Representa una cadena de caracteres modificable
            stringBuilder.append("delete from cita WHERE fecha = '"); //Anexa al final de la instancia una copia de la cadena especificada.
            stringBuilder.append(objvar.getFecha());
            stringBuilder.append("'");

            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());
            // statement.execute( "delete from tabladir  WHERE ID=1" );
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Modif(String nombreTabla, String Columnacambiar, String NuevoDato, String ColumnaClave) {
        StringBuilder stringBuilder = null;

        try {
            stringBuilder = new StringBuilder();
            stringBuilder.append("update " + nombreTabla + " set " + Columnacambiar + " = '" + NuevoDato + "' where " + ColumnaClave);

            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());
            System.out.println("todo bien el Update de: " + Columnacambiar);
            System.out.println("Update de: " + NuevoDato);
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void Modifs(String nombreTabla, String Columnacambiar, String ColumnaClave) {
        StringBuilder stringBuilder = null;

        try {
            stringBuilder = new StringBuilder();
            stringBuilder.append("update " + nombreTabla + " set " + Columnacambiar + " where " + ColumnaClave);

            Statement statement = connection.createStatement();
            statement.execute(stringBuilder.toString());
            System.out.println("todo bien el Update de: " + Columnacambiar);
            System.out.println("Update de: " + Columnacambiar);
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void close() {
        try {
            connection.close();
            System.out.println("cerrado");
        } catch (Exception ex) {
            Logger.getLogger(Data.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public String getCeldas() {
        return celdas;
    }

    public void setCeldas(String celdas) {
        this.celdas = celdas;
    }

    public String getTablas() {
        return tablas;
    }

    public void setTablas(String tablas) {
        this.tablas = tablas;
    }

    public String getLogica() {
        return logica;
    }

    public void setLogica(String logica) {
        this.logica = logica;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Data() {
    }

}
