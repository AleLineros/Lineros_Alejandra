function info(cadena) {

  var resultado = "La cadena \""+cadena+"\" ";

  // Comprobar mayúsculas y minúsculas
  //toUpperCase se usa para convertir todos los caracteres de una cadena dada a mayúsculas en este caso uso para comparar
  if(cadena == cadena.toUpperCase()) {
    resultado += " está formada sólo por mayúsculas";
  }
  else if(cadena == cadena.toLowerCase()) {
    resultado += " está formada sólo por minúsculas";
  }
  else {
    resultado += " está formada por mayúsculas y minúsculas";
  }

  return resultado;
}

alert(info("CURSO PROGRAMACIÓN WEB FULL STACK"));
alert(info(" Nivelación y fundamentos de la Programación"));
alert(info("función que muestre información sobre una cadena de texto"));
document.write (info("esto es Solo una PRUEBA"))