//Ejercicio 10
//Escribir un programa que reciba el número del mes y devuelva si tiene 31, 30 o menos días.

var mes= prompt ("Ingrese el numero del mes que desea consultar")
//uso la funcion getDate, para que no me tome como error en dia y año puse 0. 
function obtenerDiasMes( mes) {
    return new Date(0, mes, 0).getDate();
}

alert("El mes tiene " +obtenerDiasMes(mes)+ " dias");   
console.log ("El mes tiene " +obtenerDiasMes(mes)+ " dias"); 