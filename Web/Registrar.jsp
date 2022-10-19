<%-- 
   Document   : citas
   Created on : 13-oct-2016, 19:01:35
   Author     : Carlos vera
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="proceso.*" %>
<%@ page import="java.sql.*, java.util.*,java.lang.*,java.util.*, java.text.*,java.io.*,java.util.Date" %>
<%@ page session="true" %>
<%
    String usuario = "";
    var con = new var();
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("usuario") == null) {
%>
<jsp:forward page="index.html">
    <jsp:param name="error" value="Es
               obligatorio identificarse"/>
</jsp:forward>
<%
    } else {
        usuario = (String) sesionOk.getAttribute("usuario");
    }
%>
<html lang="en" class="no-js">
    <head>
        <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
        <meta charset="ISO-8859-1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro</title>
        <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/set2.css" />
        <link rel="stylesheet" href="css/Menu.css">
        <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
        <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
        <style>
            body{
                background: linear-gradient(to bottom, #111, #781342);}
            .menu--ceres .menu__link:focus {
                color: #FF2E63;
            }
            .menu--ceres .menu__item--current .menu__link {
                color:  #FF2E63;
            }
            .menu--ceres .menu__item::before,
            .menu--ceres .menu__item::after,
            .menu--ceres .menu__link::after {
                content: '';
                position: absolute;
                bottom: 0;
                background: #FF2E63;
            }
            #contenedor {
                width: 40%;
                height: 50%;
                margin: 0 auto;
                background-color: #251517;
                border: 10px solid #d94f5c;
                border-radius: 20px;
                box-shadow: 0 6px  #d94f5c;
            }
            .input{
                margin:-0.70em;
            }

            .pricing--sonam .pricing__action {
                background:   rgba(255, 46, 99, 0.3);
                z-index: 1;
                margin-top: 10px;
            }

            .pricing--sonam .pricing__action:hover {
                background:   rgba(255, 46, 99, 0.2);
            }

            <%
                List<var> lists = null;

                Data objConn = null;
                objConn = new Data();
                objConn.setDbname("dentista");
                objConn.setDriver("com.mysql.jdbc.Driver");
                objConn.setPassword(con.getContraseña());
                objConn.setUrl("jdbc:mysql://localhost/dentista");
                objConn.setUser("root");

                objConn.setId(request.getParameter("id"));

                objConn.open();
                usuario us = (usuario) sesionOk.getAttribute("algo");
                AES j = new AES();
                lists = objConn.Sesion(Integer.parseInt(j.decencriptar(us.getClvdoc())));

                if (lists != null) {
                    for (var objvar : lists) {
                        System.out.println("color:" + objvar.getBarra());

            %>

            <style>


            .menu--ceres .menu__link:focus {
                color: <%=objvar.getBarra()%>;
            }
            .menu--ceres .menu__item--current .menu__link {
                color:  <%=objvar.getBarra()%>;
            }
            .menu--ceres .menu__item::before,
            .menu--ceres .menu__item::after,
            .menu--ceres .menu__link::after {

                content: '';
                position: absolute;
                bottom: 0;
                background: <%=objvar.getBarra()%>;
            }
            html{
                background: none;
            }
            canvas{
                display: <%=objvar.getParticulas()%>;
            }
            body{



                background: linear-gradient(to bottom, <%=objvar.getFondo()%>, <%=objvar.getFondoB()%>);
                <%

                    if (objvar.getFondo().equals("#252A34")) {
                %>

                background:linear-gradient(to bottom, #111, <%=objvar.getFondoB()%>);

                <% } %>
            }

            <%

                String x = objvar.getFondo();
                System.out.println("fondo:::::::::" + x);
             if (x.equals("#C61951")) {%>


            .menu--ceres .menu__link{
                color: #56132a;
            }
            <%}%>

            canvas{
                z-index: -1;
                position: fixed;}
            </style>

            <%
                    }
                }
                objConn.close();
            %>

        </head>
        <body>
        <header>
            <div style="background: none;" class="menus" >
            <%
                //    int o=Integer.parseInt(cl);
                //   var v= new var();
                //   v.setClvdocP(o);
            %>
            <nav class="menu menu--ceres">
                <ul class="menu__list">
                    <li class="menu__item" ><a href="menu.jsp" class="menu__link">Calendario</a></li>
                    <li class="menu__item"><a href="alum.jsp" class="menu__link">Pacientes</a></li>
                    <li class="menu__item menu__item--current "><a href="" class="menu__link">Registrar</a></li>
                    <li class="menu__item"><a href="reportes.jsp" class="menu__link">Reportes</a></li>
                    <li class="menu__item"><a href="Sesion.jsp" class="menu__link">Cuenta</a></li>
                    <li class="menu__item"><a href="Solicitudes.jsp" class="menu__link">Solicitudes</a></li>
                    <li class="menu__item"><a href="cerrars.jsp" class="menu__link">Salir</a></a></li>
                </ul>
            </nav>
        </div>
    </header>
    <%   String A = null;
        String alumno = request.getParameter("T");
        System.out.println("datooooooooooo=" + alumno);
        String tipo = "";


    %>
    <style>
        canvas{
            z-index: -1;
            position: fixed;
        }

    </style>

    <div id="particles-js"></div>
    <script src="particles.js"></script>
    <script src="particulas.js"></script>
    <script language="javascript" type="text/javascript" src="validaformulario.js"></script> 
    <div class="container">
        <section class="R bg-1" style="background:none">
            <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
            <div class="pricing pricing--sonam">
                <div class="pricing__item">
                    <h3 class="pricing__title" >Registro para Pacientes</h3>
                    <form name = "citas" class="text" method="post" action="Registrar.jsp">
                        <div class="pricing__price"><span class="pricing__currency" style="color: rgba(255, 46, 99, 0.87);">Tipos</span> </div>
                        <p class="pricing__sentence">
                            Seleccionar: 
                            <input name="n2" id="n2" value="true" type="hidden">
                            <select id="T" name="T" class="select" >
                                <option value="Alumno">Alumno</option>
                                <option value="Directivo">Administrativo</option>
                                <option value="Externo">Externo</option>
                                <option value="Docente">Docente</option>
                            </select>
                        </p>
                        <br>
                        <br>
                        <br>
                        <br><br><br><br><br><br>
                        <input class="pricing__action" type='submit' name='button'  value='Siguiente'>
                    </form >
                </div>
                <%                                               DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar cal = Calendar.getInstance();
                    int año = cal.get(Calendar.YEAR);
                    String fechamaxima = (año - 10) + "-12-" + "31";

                    String fechaminima = (año - 100) + "-01" + "-01";
                    String fechadef = (año - 20) + "-01" + "01";
                %>

                <%if (request.getParameter("n2") != null && alumno.equals("Alumno")) {%> 
                <div class="pricing__item">
                    <form name = "citas" class="text" method="post" action="Alum" onSubmit = "return validarR(this)" action = "ValidaFormulario.html" >
                        <h3 class="pricing__title"><%=request.getParameter("T")%></h3>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" required type="text" id="nombre" name="nombre" maxlength="15" pattern="[A-Za-z]{3,15}" title="El nombre debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="nombre">
                                <span class="input__label-content input__label-content--kozakura" data-content="Nombre">Nombre</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" required type="text" id="apellidop" name="apellidop" maxlength="15"  pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="apellidop">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido P">Apellido P</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" required type="text" id="apellidom"  name="apellidom" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="apellidom">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido M">Apellido M</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="boleta" name="boleta" patern="[0-9]{10}" required title="la boleta son 10 numeros"/>
                            <label class="input__label input__label--kozakura" for="boleta">
                                <span class="input__label-content input__label-content--kozakura" data-content="Boleta">Boleta</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="date" id="edad" name="edad"   min="<%=fechaminima%>" max="<%=fechamaxima%>" required/>
                            <label class="input__label input__label--kozakura" for="edad">
                                <span class="input__label-content input__label-content--kozakura" data-content="Fecha de Nacimiento">Fecha de Nacimiento</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <label  class="label">Semestre:</label>
                            <select id="sem" name="sem" class="select" >
                                <option value="1">Primero</option>
                                <option value="2">Segundo</option>
                                <option value="3">Tercero</option>
                                <option value="4">Cuarto</option>
                                <option value="5">Quinto</option>
                                <option value="6">Sexto</option>
                            </select>
                        </span>
                        <span class="input input--kozakura">
                            <label  class="label">Sexo:</label>
                            <select id="sexo" name="sexo" class="select" >
                                <option value="x">Hombre</option>
                                <option value="y">Mujer</option>
                            </select>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="usua" name="usua"  maxlength="15"   pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo " />
                            <label class="input__label input__label--kozakura" for="usua">
                                <span class="input__label-content input__label-content--kozakura" data-content="Usuario" >Usuario</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="password" id="contra" name="contra" maxlength="15"   pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="contra">
                                <span class="input__label-content input__label-content--kozakura" data-content="Contraseña">Constraseña</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <input class="pricing__action" type='submit' name='button'  value='Registrar'>
                    </form>
                </div>
                <% }%>
                <%if (request.getParameter("n2") != null && alumno.equals("Directivo")) {%> 
                <div class="pricing__item">
                    <form name = "citas" class="text" method="post" action="Dir" onSubmit = "return validarDIR(this)" action = "ValidaFormulario.html" >
                        <h3 class="pricing__title"><%=request.getParameter("T")%></h3>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="nombre"  required name="nombre" maxlength="15" pattern="[A-Za-z]{3,15}" title="El Nombre debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="nombre">
                                <span class="input__label-content input__label-content--kozakura" data-content="Nombre">Nombre</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidop" name="apellidop" maxlength="15" pattern="[A-Za-z]{3,15}" required title="El apellido debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="apellidop">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido P">Apellido P</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidom" name="apellidom" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="apellidom">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido M">Apellido M</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="area" name="area" maxlength="25"  pattern="[A-Za-z]{3,36}" title="El Area debe de contener solo letras con 25 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="area">
                                <span class="input__label-content input__label-content--kozakura" data-content="Area">Area</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="date" id="edad" name="edad"   min="<%=fechaminima%>" max="<%=fechamaxima%>" required/>
                            <label class="input__label input__label--kozakura" for="edad">
                                <span class="input__label-content input__label-content--kozakura" data-content="Edad">Fecha de Nacimiento</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <label  class="label">Sexo:</label>
                            <select id="sexo" name="sexo" class="select" >
                                <option value="x">Hombre</option>
                                <option value="y">Mujer</option>
                            </select>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="usua" name="usua" maxlength="15" pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="usua">
                                <span class="input__label-content input__label-content--kozakura" data-content="Usuario">Usuario</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="password" id="contra" name="contra" maxlength="15"   pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="contra">
                                <span class="input__label-content input__label-content--kozakura" data-content="Contraseña" >Constraseña</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <input class="pricing__action" type='submit' name='button'  value='Registrar'>
                    </form>
                </div>
                <%}%>

                <%if (request.getParameter("n2") != null && alumno.equals("Docente")) {%> 
                <div class="pricing__item">
                    <form name = "citas" class="text" method="post" action="Dos" onSubmit = "return validarDIR(this)" action = "ValidaFormulario.html" >
                        <h3 class="pricing__title"><%=request.getParameter("T")%></h3>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="nombre" name="nombre" maxlength="15" pattern="[A-Za-z]{3,15}" title="El Nombre debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="nombre">
                                <span class="input__label-content input__label-content--kozakura" data-content="Nombre">Nombre</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidop" name="apellidop" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="apellidop">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido P">Apellido P</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidom" name="apellidom" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="apellidom">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido M">Apellido M</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="area" name="area" maxlength="25" pattern="[A-Za-z]{3,25}" title="El area debe de contener solo letras con 25 letras maximo"/>
                            <label class="input__label input__label--kozakura" for="area">
                                <span class="input__label-content input__label-content--kozakura" data-content="Area">Area</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="date" id="edad" name="edad"   min="<%=fechaminima%>" max="<%=fechamaxima%>" required/>
                            <label class="input__label input__label--kozakura" for="edad">
                                <span class="input__label-content input__label-content--kozakura" data-content="Edad">Fecha de Nacimiento</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <label  class="label">Sexo:</label>
                            <select id="sexo" name="sexo" class="select" >
                                <option value="x">Hombre</option>
                                <option value="y">Mujer</option>
                            </select>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="usua" name="usua" maxlength="15" pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="usua">
                                <span class="input__label-content input__label-content--kozakura" data-content="Usuario">Usuario</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="password" id="contra" name="contra" maxlength="15" pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="contra">
                                <span class="input__label-content input__label-content--kozakura" data-content="Contraseña">Constraseña</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <input class="pricing__action" type='submit' name='button'  value='Registrar'>
                    </form>
                </div>
                <%}%>

                <%if (request.getParameter("n2") != null && alumno.equals("Externo")) {%> 
                <div class="pricing__item">
                    <h3 class="pricing__title"><%=request.getParameter("T")%></h3>
                    <form name = "citas" class="text" method="post" action="Ext"  onSubmit = "return validarR(this)" action = "ValidaFormulario.html">
                        <input name="tipo" id="tipo" value="2" type="hidden">

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="nombre" name="nombre" maxlength="15" pattern="[A-Za-z]{3,15}" title="El nombre debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="nombre">
                                <span class="input__label-content input__label-content--kozakura" data-content="Nombre">Nombre</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidop" name="apellidop" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="apellidop">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido P">Apellido P</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="apellidom" name="apellidom" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido debe de contener solo letras con 15 letras maximo" />
                            <label class="input__label input__label--kozakura" for="apellidom">
                                <span class="input__label-content input__label-content--kozakura" data-content="Apellido M">Apellido M</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura"  type="date" id="edad" name="edad"   min="<%=fechaminima%>" max="<%=fechamaxima%>" required/>
                            <label class="input__label input__label--kozakura" for="edad">
                                <span class="input__label-content input__label-content--kozakura" data-content="Edad">Fecha de Nacimiento</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <label  class="label">Sexo:</label>
                            <select id="sexo" name="sexo" class="select" >
                                <option value="x">Hombre</option>
                                <option value="y">Mujer</option>
                            </select>
                        </span>

                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="usua" name="usua" maxlength="15" pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="usua">
                                <span class="input__label-content input__label-content--kozakura" data-content="Usuario">Usuario</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <span class="input input--kozakura">
                            <input class="input__field input__field--kozakura" type="text" id="contra" name="contra" maxlength="15" pattern="[a-zA-Z0-9-]+" required title="Solo letras y numeros con 15 caracteres maximo "/>
                            <label class="input__label input__label--kozakura" for="contra">
                                <span class="input__label-content input__label-content--kozakura" data-content="Contraseña">Constraseña</span>
                            </label>
                            <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                                <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                            </svg>
                        </span>
                        <input class="pricing__action" type='submit' name='button'  value='Registrar'>
                    </form>
                </div>
            </div>
            <%    }%> 
        </section>
    </div>

    <script src="js/Scroll.js"></script>
    <script src="js/menu.js"></script>


    <script src="js/counter.js"></script>
    <script src="js/retina.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/menu.js"></script>
    <script>
                    (function () {

                        if (!String.prototype.trim) {
                            (function () {

                                var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                                String.prototype.trim = function () {
                                    return this.replace(rtrim, '');
                                };
                            })();
                        }

                        [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {

                            if (inputEl.value.trim() !== '') {
                                classie.add(inputEl.parentNode, 'input--filled');
                            }


                            inputEl.addEventListener('focus', onInputFocus);
                            inputEl.addEventListener('blur', onInputBlur);
                        });

                        function onInputFocus(ev) {
                            classie.add(ev.target.parentNode, 'input--filled');
                        }

                        function onInputBlur(ev) {
                            if (ev.target.value.trim() === '') {
                                classie.remove(ev.target.parentNode, 'input--filled');
                            }
                        }
                    })();

    </script>

    <div id="contenedorB">
        <center>
            <h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
            D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
            <p>   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
        </center>
    </div>
</body>
</html>