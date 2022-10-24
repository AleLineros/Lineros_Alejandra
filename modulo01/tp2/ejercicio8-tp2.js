//Ejercicio 8
//Crea una función que genere 100 números aleatorios entre 1 y 100 que no se repitan y luego 
//imprima por pantalla usando document.write(text).
function generarAleatorio (maximo, minimo) {
    return numero= Math.round((Math.random ()* (maximo-minimo))+ minimo);
}
var numeros= new Array();
var tem= 0;
var copia= true;
var j=0;

for (var i=0; i<100; i++){
    do{
        j=0;
        copia=true;
        temp= generarAleatorio (1,100);
        for( var j=0; j< numeros.length; j++){
            if(temp==numeros [j]){
                copia= false;
            }
        }
    } while (copia== false);
    numeros[i]= temp;
}
numeros.sort( function(a,b){return});
var cont= 0;
for (var i=0; i< numeros.length; i++){
    document.write ("Numero "+ cont + ":" + numeros[i]+ "<br>");
    cont++;
}