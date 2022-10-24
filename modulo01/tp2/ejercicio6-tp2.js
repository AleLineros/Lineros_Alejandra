//Ejercicio 6
var vocales =["a","e","i","o","u"];
var  texto = prompt("Ingrese un texto");
var  textomin= texto.toLowerCase();
var  posicion= 0;
var  parar= false;
for (var i=0; i < textomin.length; i++) {
    for (var j=0; j < vocales.length; j++) {
        if (vocales [j]== textomin.charAt (i)) { 
         posicion= i+1;
         parar= true;
         break;
        }
    }
    if (parar) {
    break;
    }
}
console.log (texto)

document.write ( "la primeravocal esta en la posicion " +posicion );