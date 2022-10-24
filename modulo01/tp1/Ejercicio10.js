var array_meses=["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre","Octubre", "Noviembre", "Diciembre"  ];
console.log(array_meses);
//me permite ver que meses estan cargados en el array
let mes
mes=0
mes= window.prompt ("introduce un numero", "0");
//con esta opcion puedo pedirle al usuariio que ingrese un numero y con él encontrar un determinado mes
    if (array_meses[mes])
console.log (array_meses[mes]);
document.write(array_meses[mes], "</br>");