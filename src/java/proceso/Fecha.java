package proceso;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Calendar;
import java.util.Locale;

/**
 *
 * @author alegp
 */
public class Fecha {

private int dias;
private int mes;
private int anio ; 
public Fecha(int dias,int mes , int anio){
    this.dias= dias; 
    this.mes = mes ;
   this.anio= anio;
   
}
public int CalcularEdad(){
     mes-=1;
    Calendar o = Calendar.getInstance();
    int diaactual =o.get(Calendar.DATE);
    int anioactual = o.get(Calendar.YEAR);
    int mesactual = o.get(Calendar.MONTH);
     
    int edad = 0 ; 
     edad = anioactual-anio;
    
     if (mes>mesactual){
       
         edad-=1;
     }
    else if(mesactual==mes && diaactual<dias){
         edad-=1;
     }
     System.out.println(edad);
    return edad;
}
    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

}
