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
usuario = (String)sesionOk.getAttribute("usuario");




System.out.println("clave doctor:::::::::"+request.getParameter("clvdoc"));
}
%>
<html lang="en" class="no-js">
	<head>
		<meta charset="ISO-8859-1" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
		<title>Cambios</title>
	<noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
	
	    



	

	
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/set2.css" />
	
		 <link rel="stylesheet" href="css/Menu.css">
<link rel="stylesheet" type="text/css" href="css/Scroll.css" />
		  <link rel="stylesheet" type="text/css" href="css/ComponenteRegistro.css" />
		<style>
		
		body{
		     background: black;
                  
		}
                
          .menu--ceres .menu__link:focus {
	color: #E06060;
}

.menu--ceres .menu__item--current .menu__link {
	color:  #E06060;
}

.menu--ceres .menu__item::before,
.menu--ceres .menu__item::after,
.menu--ceres .menu__link::after {
	content: '';
	position: absolute;
	bottom: 0;
	background: #E06060;
}



	#contenedor {
       width: 40%;
       height: 50%;
        margin: 0 auto;
         background-color: #d94f5c;
		 border: 10px solid #d94f5c;
          border-radius: 20px;
          box-shadow: 0 6px  #d94f5c;

    }
      .menu--ceres .menu__link{
             
             color: ;
         }
    
    .input{
        
        margin:-0.70em;
        
    }
   
    
		</style>
		
        </head>
	<body>
	
 <header>
  <div style="background: none;" class="menus" >
       
       
 <div style="background: none;" class="menus">
        
  <nav class="menu menu--ceres"  >
					<ul class="menu__list">
						<li class="menu__item "><a href="menu.jsp" class="menu__link" style="color:#757272;">Calendario</a></li>
						<li class="menu__item menu__item--current"><a href="alum.jsp" class="menu__link"style="color:#757272;">Pacientes</a></li>
						<li class="menu__item"><a href="Registrar.jsp" class="menu__link"style="color:#757272;">Registrar</a></li>
						<li class="menu__item"><a href="reportes.jsp" class="menu__link"style="color:#757272;">Reportes</a></li>
						<li class="menu__item"><a href="#" class="menu__link"style="color:#757272;">Cuenta</a></li>
					
						<li class="menu__item"><a href="cerrars.jsp" class="menu__link"style="color:#757272;">Salir</a></li>
					</ul>
				</nav>
				
				</div>
</header>
                                                
                 <style type="text/css">
#capainicio{
position:relative;
}

#capaexpansion{
position:relative;
display:none;

}

#capaexpansion2{
position:relative;
display:none;

}

#capaexpansion3{
position:relative;
display:none;

}



#capafinal{
position:relative;

}


    
    .pricing__item :hover {
	 background: rgba(0, 0, 0, 0.74);
}
</style>                               
                                                
                                                
                                                
                                                
			    <%   String A = null;String alumno =request.getParameter("T"); System.out.println("datooooooooooo="+ alumno); 
                            String tipo="";
                           
                            
                            %>
            <script language="javascript" type="text/javascript" src="validaformulario.js"> </script> 
            <div class="container">
        <section class="R bg-1" style="background:none">
            <!-- <h2 class="pricing-section__title">Registro</h2>--><br><br><br>
            <div class="pricing pricing--sonam">
                <div class="pricing__item" style="  border-radius: 50px;">
                    <h3 class="pricing__title">Cambios</h3>
                    
                      <form name ="citas" class="text" method="post" action="ModificarCita" onsubmit="return e()"> 
                                 
			            
                                     <input type="text" name="clvpac" id="clvpac" style="visibility:hidden; position: absolute;"  value="<%=request.getParameter("clvpac")%>" >
                                           <input type="fecha" name="fecha" id="fecha" style="visibility:hidden; position: absolute;"  value="<%=request.getParameter("fecha")%>" >
				
				
                                    
                                    
                    <div class="pricing__price"><span class="pricing__currency">Seleccionar</span> </div>
                    <p class="pricing__sentence">Campo: 
                   
                    <select id="T" name="T" class="select" onchange="expandir_formulario()" style="  border-radius: 20px;" >
                                         <option value="0">opcion</option>
					  <option value="claveproc">Procedimiento</option>
					  <option value="fecha">Fecha</option>
                                       
					  </select></p>
                                          <br>
                                          <br>
                                          <div id=capaexpansion>
                                            <span class="input input--kozakura">
				
				<select id="pro" name="pro" class="select" Value="pro">
                                    <option value=""><label  class="label">Procedimiento:</label></option>
                                             <option value="2">Alergias</option>
                                              <option value="3">DX</option>
					  <option value="4">Profilaxis</option>
					  <option value="5">Ter.Cep</option>
					  <option value="6">Obtulacion</option>
					  <option value="7">Resina/Amalgama</option>
					  <option value="8">Extraccion</option>
					  <option value="9">Endodoncia</option>
					 
					  </select>
				</span>
                                        </div>
                                          
                                          <div id=capaexpansion2>
                                              <span class="input input--kozakura">
					<input class="input__field input__field--kozakura" type="number" id="dia" name="dia"  value="" max = "31" min="1"/>
					<label class="input__label input__label--kozakura" for="dia">
						<span class="input__label-content input__label-content--kozakura" data-content="Dia">Dia</span>
					</label>
					<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
				</span>
				<span class="input input--kozakura">
					<input class="input__field input__field--kozakura" type="number" id="mes" name="mes"  value="" max="12" min="1"/>
					<label class="input__label input__label--kozakura" for="mes">
						<span class="input__label-content input__label-content--kozakura" data-content="Mes">Mes</span>
					</label>
					<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
				</span>
				<span class="input input--kozakura">
					<input class="input__field input__field--kozakura" type="number" id="year" name="year"  value="" />
					<label class="input__label input__label--kozakura" for="year">
						<span class="input__label-content input__label-content--kozakura" data-content="A&ntilde;o">A&ntilde;o</span>
					</label>
					<svg class="graphic graphic--kozakura" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M1200,9c0,0-305.005,0-401.001,0C733,9,675.327,4.969,598,4.969C514.994,4.969,449.336,9,400.333,9C299.666,9,0,9,0,9v43c0,0,299.666,0,400.333,0c49.002,0,114.66,3.484,197.667,3.484c77.327,0,135-3.484,200.999-3.484C894.995,52,1200,52,1200,52V9z"/>
					</svg>
				</span>
				<span class="input input--kozakura">
				
				<select id="hora" name="hora" class="select" >
                                     <option value=""><label  class="label">Hora:</label></option>
					  <option value="15:00:00">3:00</option>
					  <option value="15:30:00">3:30</option>
					  <option value="16:00:00">4:00</option>
					  <option value="16:30:00">4:30</option>
					  <option value="17:00:00">5:00</option>
					  <option value="17:30:00">5:30</option>
					  <option value="18:00:00">6:00</option>
					  <option value="18:30:00">6:30</option>
					  <option value="19:00:00">7:00</option>
					  <option value="19:30:00">7:30</option>
					  <option value="20:00:00">8:00</option>
					  <option value="20:30:00">8:30</option>
					  </select>
				</span>
                                              
                                          </div>
                                          <%
                                       //   System.out.println("paciente::::"+request.getParameter("clvpac"));
                                          %>
                                          
                    <br>
                    <br><br><br><br><br><br>
                    <input class="pricing__action" type='submit' name='button' style="  border-radius: 50px;" value='Cambiar'>
			</form >		
                </div>
                
        </section>
    </div>
                                          <script>
                                           document.citas.year.min = new Date().getFullYear();
      document.citas.year.max = new Date().getFullYear()+100;
                                              function e(){
                                                  if(document.citas.T.value === "0"){
                                                      return false;
                                                  }
                                                  else if(document.citas.T.value ==="claveproc" && document.citas.pro.value===""){
                                                      return false;
                                                  }
                                                  
                                                   else if(document.citas.T.value ==="fecha" ){
                                                      var dia = document.citas.dia.value;
          dia = parseInt(dia);    
       var mes = parseInt(document.citas.mes.value);
       var ano = parseInt(document.citas.year.value);var  o =new Date().getFullYear();
      
      
         
          if(ano<3000 && ano>=o){
        if(mes===1){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        }      
       else  if(mes===2){
            if(dia>=1 && dia<=29){
                if(dia===29){
                    return ((o % 4 == 0 && o % 100 != 0) || o % 400 == 0);
                }
                else{
                return true;}
            }
            else{
                return false;
            }
        }       
       else if(mes===3){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        }      
       else if(mes===4){
            if(dia>=1 && dia<=30){
                return true;
            }
              else{
                return false;
            }
        }      
        else if(mes===5){
            if(dia>=1 &&dia<=31){
                return true;
            }
              else{
                return false;
            }
        } 
       else  if(mes===6){
            if(dia>=1 && dia<=30){
                return true;
            }
              else{
                return false;
            }
        } 
       else  if(mes===7){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        } 
     else    if(mes===8){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        }
      else   if(mes===9){
            if(dia>=1 && dia<=30){
                return true;
            }
              else{
                return false;
            }
        } 
      else   if(mes===10){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        } 
     else    if(mes===11){
            if(dia>=1 && dia<=30){
                return true;
            }
              else{
                return false;
            }
        } 
    else     if(mes===12){
            if(dia>=1 && dia<=31){
                return true;
            }
              else{
                return false;
            }
        }
        else{
            return false;
        }
        
        }
        else{
            return false;
        }
          
          
                                                  }
                                                  
                                                  
                                                  
                                              }
                                              
                                                 
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              </script>
            
           <script> 
            
            
        function expandir_formulario(){ 
if (document.citas.T.value == "0"){ 
   	xDisplay('capaexpansion', 'none') 
   	xDisplay('capaexpansion2', 'none') 
   
        
} 

if (document.citas.T.value == "claveproc"){ 
   	xDisplay('capaexpansion', 'block') 
   	xDisplay('capaexpansion2', 'none') 
   	
} 

if (document.citas.T.value == "fecha"){ 
   	xDisplay('capaexpansion', 'none') 
   	xDisplay('capaexpansion2', 'block') 
   	
} 

}    
            
</script> 
	            
                                    
	
	
	
	 <script src="js/Scroll.js"></script>
<script src="js/menu.js"></script>
		
<br><br>
<br>
<br>

<script>
    (function() {
				
				if (!String.prototype.trim) {
					(function() {
						
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
				}
			})();
    
</script>
     <script type='text/javascript' src='js/formexp.js'></script>
<div id="contenedorB">
    
    <center><h4>INSTITUTO POLITÉCNICO NACIONAL</h4>
        D.R. Instituto Politécnico Nacional (IPN), Av. Luis Enrique Erro S/N, Unidad Profesional Adolfo López Mateos, Zacatenco, Delegación Gustavo A. Madero, C.P. 07738, Ciudad de México; México 2009-2013.
       <p>   Este sitio es una obra intelectual protegida por la Ley Federal del Derecho de Autor, puede ser reproducida con fines no lucrativos, siempre y cuando no se mutile, se cite la fuente completa y su dirección electrónica; su uso para otros fines, requiere autorización previa y por escrito del Director General del Instituto.
</center>
    
</div>
	</body>
</html>

