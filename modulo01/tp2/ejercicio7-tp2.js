//Ejercicio 7
//Escribir una función que reciba un texto y lo devuelva al revés.

function invertirCadena (cad) {
    var nuevaCadena= " ";
    for (var i= cad.length - 1; i>=0 ; i--){
        nuevaCadena += cad[i];
    }
    return nuevaCadena
}
console.log (invertirCadena("hola")); 

//otra posibilidad es (pero creo que no se ajusta a la consigna)
var texto = prompt ("ingrese una palabra");

console. log (texto)
var textoInvertido= texto.split("").reverse().join("");
console.log (textoInvertido);