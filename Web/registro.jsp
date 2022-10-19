<%-- 
    Document   : registro
    Created on : 14/04/2017, 04:21:02 PM
    Author     : alegp
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="proceso.var"%>
<%@page import="proceso.Data"%>
<%@page import="proceso.usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        
    
  
        
        %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<% HttpSession ok = request.getSession(); 
ok.invalidate(); %>
<%    ArrayList<usuario> doctores;
  var con = new var();
  try{
  usuario u = new usuario();
  u.pad();}
  catch(Exception e) {
      
  }
Data objConn = null;
   objConn = new Data();
   objConn.setDbname( "dentista" );
   objConn.setDriver( "com.mysql.jdbc.Driver" );
   objConn.setPassword(con.getContraseña());
   objConn.setUrl( "jdbc:mysql://localhost/dentista" );
   objConn.setUser( "root" );
   objConn.open();
doctores = objConn.Consultardocs();



%>


<%                                               DateFormat fecha2 = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar cal = Calendar.getInstance();
                    int año = cal.get(Calendar.YEAR);
                    String fechamaxima = (año - 10) + "-12-" + "31";

                    String fechaminima = (año - 100) + "-01" + "-01";
                    String fechadef = (año - 20) + "-01" + "01";
                %>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
      <link rel="stylesheet" type="text/css" href="css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
      <link rel="stylesheet" type="text/css" href="css/demo.css" />
      <link rel="stylesheet" type="text/css" href="css/set2.css" />
      <link rel="stylesheet" href="css/Menu.css">
      <link rel="stylesheet" type="text/css" href="css/Scroll.css" />
      <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
      <link rel="stylesheet" type="text/css" href="css/D.css" />
      <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
        <title>Registrarse</title>
    </head>
    <body onload="Captcha();">
         <style>
        .capt{
	background-color:grey;
	width: 300px;
	height:100px;
	    margin-top: 20px;
}

#mainCaptcha{
	position: relative;
	
	top: 5px;
	
}

#refresh{
    border: 10px;
	position:relative;
	    background: rgba(195, 117, 117, 0.77);
	width:50%;
	border-radius: 5px; 
	bottom:-35px;
	background-image: url(rpt.jpg);
        color: white;
}

#txtInput, #Button1{
	position: relative;
	
	bottom: 18px;
}
 .inputt{
         width: calc(100% - 0.1em);
         background:#494e57;
             position: relative;
              
                border: none;
                padding: 10;
                color: white;
                margin: 7;
                border-radius: 3px;
         }
        </style>
          <div style="width: 30%;" class="content__top"></div>
    <div class="container">
             <section class="R bg-1" style="background:black">
           
              <svg  class="hidden">
		<symbol id="icon-arrow"  viewBox="0 0 24 24">
			<title>arrow</title>
			<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 " />
		</symbol>
              </svg>
            <div style="width: 20%;" class="codrops-links">
		<a style="padding:0em;" class="" href="inicio.html" title="atras"><svg  style="" class="icon icon--arrow"><use xlink:href="#icon-arrow"></use></svg></a>
	    </div>
            <div class="pricing pricing--sonam">
               <div style=" padding-bottom: 5em;" class="pricing__item">  
                <h3 class="pricing__title" >Registro</h3>
        
        
        
        <form name = "forma" action ="regisalumn" onsubmit="return enviar();">
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
                          <input class="input__field input__field--kozakura" type="text" id="ap" name="ap" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido paterno debe de contener solo letras con 15 letras maximo" />
                        <label class="input__label input__label--kozakura" for="ap">
                          <span class="input__label-content input__label-content--kozakura" data-content="Apellido Paterno">Apellido Paterno</span>
                        </label>
                        <svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
                           <path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
                        </svg>
                        </span>
            
            <span class="input input--kozakura">
                          <input class="input__field input__field--kozakura" type="text" id="am" name="am" maxlength="15" pattern="[A-Za-z]{3,15}" title="El apellido materno debe de contener solo letras con 15 letras maximo" />
                        <label class="input__label input__label--kozakura" for="am">
                          <span class="input__label-content input__label-content--kozakura" data-content="Apellido Materno">Apellido Materno</span>
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
                             <label  class="label">Sexo:</label>
            <select class="select" name="sex">
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
            
            <span class="input input--kozakura">
                             <label  class="label">Tipo de Paciente:</label>
            
            <Select  class="select"  name="tipo" onchange="metodin()">
                <option value="ex">Externo</option>
                <option value="al">
                    Alumno
                </option>
                <option value="do">Docente</option>
                <option value="ad">Administrativo</option>
            </Select> </span>
            
            
            <br>
            <p  style="visibility:hidden" id="texto1">Area </p><input class="inputt" name ="area" id="are" maxlength="20" pattern="[A-Za-z]{3,20}" title="El area debe de contener solo letras con 20 letras maximo"  style="visibility:hidden">
            <p  style="visibility:hidden" id="texto2"> Boleta</p><input type="text" pattern="[0-9]{10}" title="numero de 10 cifras" class="inputt" name ="boleta" id="bole"  style="visibility:hidden"> <br>
            <p  style="visibility:hidden" id="texto3"> Semestre</p><select class="select" name ="semestre" id="seme"   style="visibility:hidden"><option value="1">Primero </option>
            <option value="2">Segundo</option>
            <option value="3">Tercero </option>
            <option value="4">Cuarto </option>
            <option value="5">Quinto </option>
            <option value="6">Sexto </option></select><br>
           <label  class="label">Doctor:</label>  <Select class="select" name="doctor"><% for(usuario u : doctores){
                %> <option value="<%=u.getClvdoc()%>">   <%=u.getNombre()+ " " +u.getApellidop() + " " +u.getApellidom()%>  </option> 
         <%   }

                %>
                
                
                
                
                
            </Select> <br>
            
            <div class="capt"> 
   <h2 type="text" id="mainCaptcha"></h2>
   <p><input type="button" id="refresh" onclick="Captcha();" value="refrescar"/></p>            <input type="text" id="txtInput"/> 
            <input style="margin-top: 40px;    " class="pricing__action" type="submit" value="registrarse">

      </form></div></div></div>
</section>
   </body>
    <script>
        function metodin() {
            if (document.forma.tipo.value === "al") {
                document.getElementById("bole").style.visibility = 'visible';
                document.getElementById("texto2").style.visibility = 'visible';
                document.getElementById("are").style.visibility = 'hidden';
                document.getElementById("texto1").style.visibility = 'hidden';
                document.getElementById("seme").style.visibility = 'visible';
                document.getElementById("texto3").style.visibility = 'visible';
            }
            if (document.forma.tipo.value === "do" || document.forma.tipo.value === "ad") {
                document.getElementById("are").style.visibility = 'visible';
                document.getElementById("texto1").style.visibility = 'visible';
                document.getElementById("bole").style.visibility = 'hidden';
                document.getElementById("texto2").style.visibility = 'hidden';
                document.getElementById("seme").style.visibility = 'hidden';
                document.getElementById("texto3").style.visibility = 'hidden';
            }
            if (document.forma.tipo.value === "ex") {
                document.getElementById("are").style.visibility = 'hidden';
                document.getElementById("texto1").style.visibility = 'hidden';
                document.getElementById("bole").style.visibility = 'hidden';
                document.getElementById("texto2").style.visibility = 'hidden';
                document.getElementById("seme").style.visibility = 'hidden';
                document.getElementById("texto3").style.visibility = 'hidden';
            }
        }
        function enviar() {
            if (document.forma.nombre.value === "" || document.forma.ap.value === "" || document.forma.am.value === "" || document.forma.edad.value === "" || document.forma.usua.value === "" || document.forma.contra.value === "")
            {
                alert("Llene todos los campos en su totalidad");
                return false;

            }
            if (document.forma.edad.value.length < 10) {
                  alert("ponga una fecha en el formato correcto");  
            return false;

            }
            if(document.forma.tipo.value==="al" && document.getElementById("bole").value==="" ){
                alert("ponga su boleta");      
            return false;
            }
             if((document.forma.tipo.value==="do" || document.forma.tipo.value==="ad") && document.getElementById("are").value==="" ){
            alert("ponga su area");   
            return false;
            }
            if(!(ValidCaptcha())){
                alert("el Captcha no es correcto, recuerde que es sensible a mayusculas");
                return false;
            }
         return ValidCaptcha();

        }
        function algo(event) {
            var cual = event.which;

            if ((cual >= 48 && cual <= 57) || (cual >= 97 && cual <= 122) || (cual >= 65 && cual <= 90) || cual === 8 || cual === 0) {
                return true;
            } else {
                return false;
            }
        }
        function e(event) {
            var longitud = document.forma.edad.value.length;
            if (longitud >= 10) {
                return false;
            }
            if (longitud === 2) {
                document.forma.edad.value = document.forma.edad.value + "/";
            }
            if (longitud === 5) {
                document.forma.edad.value = document.forma.edad.value + "/";
            }
            var cual = event.which;

            if (cual >= 48 && cual <= 57) {
                return true;
            } else {
                return false;
            }
        }
        function Captcha(){
     var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
	 	'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
 	    	'0','1','2','3','4','5','6','7','8','9');
     var i;
     for (i=0;i<6;i++){
         var a = alpha[Math.floor(Math.random() * alpha.length)];
         var b = alpha[Math.floor(Math.random() * alpha.length)];
         var c = alpha[Math.floor(Math.random() * alpha.length)];
         var d = alpha[Math.floor(Math.random() * alpha.length)];
         var e = alpha[Math.floor(Math.random() * alpha.length)];
         var f = alpha[Math.floor(Math.random() * alpha.length)];
         var g = alpha[Math.floor(Math.random() * alpha.length)];
                      }
         var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
         document.getElementById("mainCaptcha").innerHTML = code
		 document.getElementById("mainCaptcha").value = code
       }
function ValidCaptcha(){
     var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
     var string2 =         removeSpaces(document.getElementById('txtInput').value);
     if (string1 === string2 ){
            return true;
     }else{        
          return false;
          }
}
function removeSpaces(string){
     return string.split(' ').join('');
}
    </script>
     <script src="js/Scroll.js"></script>
      <script src="js/menu.js"></script>
     <script src="js/counter.js"></script>
     
      <script src="js/custom.js"></script>
      <script src="js/menu.js"></script>
</html>
