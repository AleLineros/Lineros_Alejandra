//Ejercicio 3

//Utilizando la estructura FOR, crear un script que pueda calcular el factorial de un número entero.
var numero= prompt ("Ingrese un numero para obtener su factorial")
var resultado = 1;

for (var i=1; i<numero; i++){
    resultado *=i;
}
alert(resultado);
console.log (resultado);