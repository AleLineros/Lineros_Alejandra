//Ejercicio 1
//Determinar cuál de los elementos de texto es mayor, es decir el que contenga más letras
var verdadero, char // defino las variables del array. otra opcion era poner comillas pero me modifica el resultado de un ejercicio.
var valores = [verdadero, false, 2, "hola", "mundo", 3, char];
var cantidadLetras=[];
var listaNumeros=[];
for (let i=0; i<valores.length; i++){
    if (typeof valores [i]==="string"){
        cantidadLetras.push (valores[i]);
    }
}
console.log (cantidadLetras);

document.write ()
 
//Imprimir los elementos de menor a mayor cantidad de letras

Mayor=0
PalabraMayor=0
for (let i=0; i<cantidadLetras.length; i++){
    if (cantidadLetras[i].length>Mayor){
        PalabraMayor=cantidadLetras[i];
        Mayor=cantidadLetras[i].length;
    }
}
document.write ("La palabra que mayor cantidad de letras tiene es: "+PalabraMayor+"<br>");

document.write("Elementos ordenados de menor a mayor segun la cantidad de letras:"+"<br>"+cantidadLetras.sort(function(a,b){return a.length-b.length})+"<br>");

//Determinar el resultado de las cuatro operaciones matemáticas realizadas con los dos elementos numéricos.

for (let i=0; i<valores.length; i++){
    if (typeof valores [i]==="number"){
        listaNumeros.push(valores[i])
    }
}

//en la lista de numero acumulo todos los valores numericos que tiene el array y 
//luego los invoco en una funcion para realizar las operaciones matematicas
function suma(a,b){
    return a+b 
}
var sumatoria= listaNumeros.reduce( suma);
console.log(sumatoria);


function resta(a,b){
    return a-b 
}
var sustraer= listaNumeros.reduce( resta);
console.log(sustraer);


function multiplicar(a,b){
    return a*b
}
var multiplicacion= listaNumeros.reduce(multiplicar);
console.log(multiplicacion);

function dividir(a,b){
    return a/b 
}
var division= listaNumeros.reduce( dividir);
console.log(division);

document.write ("La suma de los valores es: "+sumatoria+"<br>");
document.write("La reta de los valores es: "+sustraer+"<br>" );
document.write("El resultado de la multiplicacion es: " +multiplicacion+"<br>");
document.write("El resultado de la division es: "+ division+"<br>");
