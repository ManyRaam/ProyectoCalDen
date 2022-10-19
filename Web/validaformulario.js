function e(event,formulario) {
            var longitud = formulario.value.length;
            if (longitud >= 10) {
                return false;
            }
            if (longitud === 2) {
                formulario.value = formulario.value + "/";
            }
            if (longitud === 5) {
                formulario.value = formulario.value + "/";
            }
            var cual = event.which;

            if (cual >= 48 && cual <= 57) {
                return true;
            } else {
                return false;
            }
        }
        
     
function validarR(formulario) {
                        
                        
                        
			if (formulario.nombre.value.length < 2) {
				alert("2 caracteres minimos en 'nombre'");
				formulario.nombre.focus();
			return (false);
			}
                        
//ALTER TABLE
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var checkSt = formulario.nombre.value;
		var allValid = true;

	for (i = 0; i < checkSt.length; i++) {
		ch = checkSt.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'nombre'");
		formulario.nombre.focus();
		return (false);
	}
        
        //
        //ALTER TABLE
        if (formulario.apellidom.value.length < 2) {
				alert("2 caracteres minimos en 'Apellido materno'");
				formulario.apellidom.focus();
			return (false);
			}
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var apellidom = formulario.apellidom.value;
		var allValid = true;

	for (i = 0; i < apellidom.length; i++) {
		ch = apellidom.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'Apellido materno'");
		formulario.apellidom.focus();
		return (false);
	}
        
        //
        //ALTER TABLE
        if (formulario.apellidop.value.length < 2) {
				alert("2 caracteres minimos en 'Apellido Paterno'");
				formulario.apellidop.focus();
			return (false);
			}
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var apellidop = formulario.apellidop.value;
		var allValid = true;

	for (i = 0; i < apellidop.length; i++) {
		ch = apellidop.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'Apellido Paterno'");
		formulario.apellidop.focus();
		return (false);
	}
        
        //
if (formulario.boleta.value.length < 10) {
				alert("10 caracteres minimos en 'boleta'");
				formulario.boleta.focus();
			return (false);
			}
                        if (formulario.boleta.value.length > 10) {
				alert("10 caracteres maximos en 'boleta'");
				formulario.boleta.focus();
			return (false);
			}
//ALTER TABLE
		var checkOK = "1234567890";
		var chec = formulario.boleta.value;
		var allValid = true;

	for (i = 0; i < chec.length; i++) {
		ch = chec.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'boleta'");
		formulario.boleta.focus();
		return (false);
	}
        
        //

  
                        
                    

		var checkOK = "1234567890/";
		var checkStr = formulario.edad.value;
                
		var allValid = true;
                var le = 9;
                var lee = 0;
                var le2 = checkSrt.length;
                alert(le2);

	for (i = 0; i < checkStr.length; i++) {
		
			for (j = 0; j < checkOK.length; j++){
			if (checkStr.charAt(i) == checkOK.charAt(j)){
				lee = lee +1;
                            }
                            
        }

			
	}
        alert(lee);
        if(lee!=le2){
            allValid = false;
        }
        if (!allValid) {
		alert("solo caracteres validos en 'edad'");
		formulario.edad.focus();
		return (false);
	}
//

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      if (formulario.apellidop.value.length < 2) {
				alert("2 caracteres minimos en 'apellidop'");
				formulario.apellidop.focus();
			return (false);
			}

		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var checkStrr = formulario.apellidop.value;
		var allValid = true;

	for (i = 0; i < checkStrr.length; i++) {
		ch = checkStrr.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo numeros en el campo 'edad'");
		formulario.apellidop.focus();
		return (false);
	}

//

if (formulario.contrsena.value.length < 2) {
				alert("2 caracteres minimos en 'contraseña'");
				formulario.contrsena.focus();
			return (false);
			}
//ALTER TABLE
		var checkOK = "1234567890. ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var che = formulario.contrsena.value;
		var allValid = true;

	for (i = 0; i < che.length; i++) {
		ch = che.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'contraseña'");
		formulario.contrsena.focus();
		return (false);
	}

//

if (formulario.curp.value.length < 18) {
				alert("18 caracteres minimos en 'curp'");
				formulario.curp.focus();
			return (false);
			}
//ALTER TABLE
		var checkOK = "1234567890. ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var ch = formulario.curp.value;
		var allValid = true;

	for (i = 0; i < ch.length; i++) {
		ch = ch.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'curp'");
		formulario.curp.focus();
		return (false);
	}


  	/*/clave1 = document.f1.clave1.value 
   	clave2 = document.f1.clave2.value 

   	if (clave1 == clave2) 
      	alert("Las dos claves son iguales...\nRealizaríamos las acciones del caso positivo") 
   	else 
      	alert("Las dos claves son distintas...\nRealizaríamos las acciones del caso negativo") 
/*/
    }
    
     function validarDir(formularioD) {
         
         if (formularioD.nombre.value.length < 2) {
				alert("2 caracteres minimos en 'nombre'");
				formularioD.nombre.focus();
			return (false);
			}
//ALTER TABLE
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var checkSt = formularioD.nombre.value;
		var allValid = true;

	for (i = 0; i < checkSt.length; i++) {
		ch = checkSt.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'nombre'");
		formularioD.nombre.focus();
		return (false);
	}
        
        //
        //ALTER TABLE
        if (formularioD.apellidom.value.length < 2) {
				alert("2 caracteres minimos en 'Apellido materno'");
				formularioD.apellidom.focus();
			return (false);
			}
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var apellidom = formularioD.apellidom.value;
		var allValid = true;

	for (i = 0; i < apellidom.length; i++) {
		ch = apellidom.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'Apellido materno'");
		formularioD.apellidom.focus();
		return (false);
	}
        
        //
        //ALTER TABLE
        if (formularioD.apellidop.value.length < 2) {
				alert("2 caracteres minimos en 'Apellido Paterno'");
				formularioD.apellidop.focus();
			return (false);
			}
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var apellidop = formularioD.apellidop.value;
		var allValid = true;

	for (i = 0; i < apellidop.length; i++) {
		ch = apellidop.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo letras en el campo 'Apellido Paterno'");
		formularioD.apellidop.focus();
		return (false);
	}
        
        //
if (formularioD.area.value.length < 2) {
				alert("2 caracteres minimos en 'area'");
				formularioD.area.focus();
			return (false);
			}
//ALTER TABLE
		var checkOK = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú";
		var chec = formularioD.area.value;
		var allValid = true;

	for (i = 0; i < chec.length; i++) {
		ch = chec.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'area'");
		formularioD.area.focus();
		return (false);
	}
        
        //

  

		var checkOK = "1234567890/";
		var checkStr = formularioD.edad.value;
		var allValid = true;

	for (i = 0; i < checkStr.length; i++) {
		ch = checkStr.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en 'edad'");
		formularioD.edad.focus();
		return (false);
	}
         
     }
    
 function validarC(formularioF) {
//ALTER TABLE

if (formularioF.dia.value.length < 2) {
				alert("2 caracteres minimos en 'dia'");
				formularioF.dia.focus();
			return (false);
			}
                        
                        if (formularioF.dia.value.length > 2) {
				alert("2 caracteres solo en 'dia'");
				formularioF.dia.focus();
			return (false);
			}
                        
                        if (formularioF.dia.value > 31) {
				alert("solo los dias del mes");
				formularioF.dia.focus();
			return (false);
			}
                        
                       
//ALTER TABLE
		var checkOK = "1234567890";
		var checkSt = formularioF.dia.value;
		var allValid = true;

	for (i = 0; i < checkSt.length; i++) {
		ch = checkSt.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo numeros 'Dia'");
		formularioF.dia.focus();
		return (false);
	}

//

if (formularioF.mes.value.length < 2) {
				alert("2 caracteres minimos en 'mes'");
				formularioF.mes.focus();
			return (false);
			}
                        
                        if (formularioF.mes.value > 12) {
				alert("solo hay 12 meses");
				formularioF.dia.focus();
			return (false);
			}
                        

		var chekOK = "1234567890";
		var chk = formularioF.mes.value;
		var allValid = true;
                
	for (i = 0; i < chk.length; i++) {
		chk = chk.charAt(i);
			for (j = 0; j < chekOK.length; j++)
			if (chk == chekOK.charAt(j))
				break;

			if (j == chekOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'Mes'");
		formularioF.mes.focus();
		return (false);
	}
    //
    
     //meses
                       
                       if (formularioF.mes.value = 11 && formularioF.dia.value > 30 ) {
				alert("solo los dias del mes correspondientes");
				formularioF.dia.focus();
			return (false);
			}
                       
                        //
    
    
    
    	var checkOK = "1234567890. ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú ";
		var chkj = formularioF.mensaje.value;
		var allValid = true;

	for (i = 0; i < chkj.length; i++) {
		chkj = chkj.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (chkj == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'Mensaje'");
		formularioF.mensaje.focus();
		return (false);
	}
    }
function validarD(formularioD) {   
     
     
     var checkOK = "1234567890. ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚ" + "abcdefghijklmnñopqrstuvwxyzáéíóú ";
		var checkSt = formularioD.dato.value;
		var allValid = true;

	for (i = 0; i < checkSt.length; i++) {
		ch = checkSt.charAt(i);
			for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
				break;

			if (j == checkOK.length) {
			allValid = false;
			break;
			}
	}
        if (!allValid) {
		alert("solo caracteres validos en el campo 'Dato'");
		formularioD.dato.focus();
		return (false);
	}
     } 
        
