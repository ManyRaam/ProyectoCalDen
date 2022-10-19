<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : loginnuevo
    Created on : 26/03/2017, 01:06:21 PM
    Author     : alegp
--%>
<% HttpSession ok = request.getSession(); 
ok.invalidate(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Alumnos</title>
		
		<link rel="stylesheet" type="text/css" href="css/D.css" />
		<link rel="shortcut icon" href="img/ipn.jpg" type="image/png" />
		<link rel="stylesheet" type="text/css" href="css/buttons.css" />
                <noscript>
  <meta http-equiv="refresh" content="0;url=nohayjava.jsp">
</noscript>
		<link rel="stylesheet" type="text/css" href="css/tilteffect.css" />
                <link rel="stylesheet" type="text/css" href="css/set2.css" />
			<link rel="stylesheet" type="text/css" href="css/letras.css" />
           
        </head>
    <body>
        
         <body><div class="container">
			<header class="H">
                            
				
				<div class="hero">
					<div class="hero__imgwrap">
					  
						<img class="hero__img tilt-effect" data-tilt-options='{ "opacity" : 0.6, "movement": { "perspective" : 1500, "translateX" : 10, "translateY" : 10, "translateZ" : 2, "rotateX" : 3, "rotateY" : 3 } }' src="img/2.jpg" alt="Hero image" />
					</div>
        
                                    <h1>
                                    
			<div style="    width: 30%;" class="content__top">
				
				
				
				<div class="codrops-links">
					<a style="padding:0em;" class="codrops-icon codrops-icon--prev" href="inicio.html" title="atras"><svg  style="font-size: 45%; " class="icon icon--arrow"><use xlink:href="#icon-arrow"></use></svg></a>
					
				</div>
				
			</div>
                                        <div class="grid__item color-3">
                                            <a class="link N" style=" " href="#">Login <span style="font-size: 1em; font-family: 'Playfair Display', Georgia, serif;">A</span>lumnos</a>
			</div>  
                                       
                                        <br>
                                        <form name="forma" onsubmit="return e()" action="ValidacionAlumno">					 <span class="input input--nao">
					<input class="input__field input__field--nao" type="text" id="nombre" name="nombre" maxlenght ="20" onkeypress ="return algo(event);"/>
					<label class="input__label input__label--nao" for="nombre">
						<span class="input__label-content input__label-content--nao">Nombre</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
				</span>
				<span class="input input--nao">
					<input  class="input__field input__field--nao" type="password" id="contra" name="contra" onkeypress="return e2(event)" maxlenght ="20"/>
					<label  class="input__label input__label--nao" for="contra">
						<span class="input__label-content input__label-content--nao">Contrase&ntilde;a</span>
					</label>
					<svg class="graphic graphic--nao" width="300%" height="100%" viewBox="0 0 1200 60" preserveAspectRatio="none">
						<path d="M0,56.5c0,0,298.666,0,399.333,0C448.336,56.5,513.994,46,597,46c77.327,0,135,10.5,200.999,10.5c95.996,0,402.001,0,402.001,0"/>
					</svg>
                                        </span>
                                        <br>
                                             <div class="box bg-1">
                                                
                                                   	  <input type="submit" class="button button--moema button--inverted button--text-thick button--size-s" style="height: none; padding: 0em 0em;" value="ingresar">
                                                             
				
        
        <script>            
             function e(){
                                      var a =   document.formulario.nombre.value;
                                      var b = document.formulario.contra.value;
                                      if(a.length === 0 || b.length=== 0){
                                          return false;
                                          
                                      }
                                       else{
                                           return true;
                                       } 
                                        
                                        
                                        
                                    }
            function algo(event){
                 var cual = event.which;
            
                  if((cual>=48 && cual<=57)||(cual>=97 && cual<=122)||(cual>=65 && cual<=90)|| cual===8 || cual === 0){
                return true;
            }
                 else {
                     return false ;
                 }
            }
              </script>
            </div></form>
                     <br>  <svg  class="hidden">
		<symbol id="icon-arrow"  viewBox="0 0 24 24">
			<title>arrow</title>
			<polygon points="6.3,12.8 20.9,12.8 20.9,11.2 6.3,11.2 10.2,7.2 9,6 3.1,12 9,18 10.2,16.8 " />
		</symbol>
		
	</svg>
                                                             
       
	          
            <font style="font-weight: 100; font-size: .35em;">¿No tienes cuenta? <a href="registro.jsp" style="color:rgba(0, 255, 170, 0.64);"> Registrate </a> </font>  
				</h1>
                                     
				</div>
                         
                           
                            
			</header>
            
            
            
            
            
          
       
        
        
      
            
        <script src="js/TweenMax.min.js"></script>
		
	
		<script src="js/tiltfx.js"></script>
              <script src="js/Letras.js"></script>
    </body>
    
</html>
