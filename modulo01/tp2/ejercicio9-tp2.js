//Ejercicio 9
// imprimir en pantalla si el valor de media es < 5 “Reprobado”, entre 6 y 8 “Aprobado” y si es mayor a 8 “Sobresaliente”
var notas =[2,8,9,6,7];
var suma =notas.reduce((a,n)=>(a +=n,a), 0);
let promedio= suma / notas.length
console.log (promedio)
    if(promedio >= 8 ) {
        console.log("El resultado de sus notas es : Sobresaliente " +promedio );
      }
     else 
      if(promedio < 8 ||promedio >=6) {
        console.log("El resultado de sus notas es : Aprobado " +promedio );;
      }
      else
      if(promedio <= 5) {
        console.log("El resultado de sus notas es : Desaprobado " +promedio );
      }