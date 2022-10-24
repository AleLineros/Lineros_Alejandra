//Ejercicio 4
//Escribir el código de una función a la que se pasa como parámetro un número entero y
//devuelve como resultado una cadena de texto que indica si el número es par o impar
var numero =prompt ("Ingrese un numero entero");
var resultado = parImpar(numero);
alert("El número "+numero+" es "+resultado);
document.write ("El número "+numero+" es "+resultado);
function parImpar(numero) {
  if(numero % 2 == 0) {
    return "par";
  }
  else {
    return "impar";
  }
}