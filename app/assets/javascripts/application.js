// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
<<<<<<< HEAD
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

 
$(document).ready(function(){  
  //ocultarDatosCliente(); 
  $('#clavelibro').on("change",function() {
    //pasar a cantidad´p+´p+
    $("#cantidadlibro").focus();
  });

  $('#cantidadlibro').on("keypress",function(event) {
    //buscar el libro por codigo y agregarlo
    if ( event.which == 13){
      agregaLibro($('#clavelibro').val());      
    }
  });

  $("#guardarVenta").on("click", function(){
    //enviar formulario
    $("#new_sale").submit();
  });

   $("#guardarOrden").on("click", function(){
    //enviar formulario
    $("#new_order").submit();
  });

//Busqueda de cliente http://gastonramos.com.ar/rails21/
  $('#clavecliente').on("keypress",function(event) {
    //buscar el cliente por rfc y agregarlo
    if ( event.which == 13){      
      var nombreCliente = $("#clavecliente").val().toLowerCase();
      buscarCliente($("#clavecliente").val().toLowerCase());
    }
  });

  //$('#checatipocliente').on("keypress",function(event) {
  //if (document.getElementById("checatipocliente").checked==true)) {    
    //alert("hemos seleccionado el checkbox");
  //}

});

function agregaLibro(isbn){
  var index = $(".idLibroVender").length;

  alert("Codigo"+index);

  if(isbn == "" || isbn == NaN)
  {
    alert("ingrese el código del libro.");
    $("#cantidadlibro").val(1);
    $('#clavelibro').focus();
    return;
  }

  $.ajax({
    dataType: "json",
    url: "http://localhost:3000/products/find.json?isbn=" + isbn
  })
  .done(function(data) {
      if(data.id == null){
        alert("No se encontró el libro.");
        resetAgregaLibro();
        return;
      }      
        var totalLibros = data.cantidad;
        var cantidadlibrocompra =  $("#cantidadlibro").val();        
        var descuento = ((data.precio / 100) * $("#descuentolibro").val());
        var totaldescuento = (descuento * $("#cantidadlibro").val());
        //var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_product_id\" name=\"sale[saleDetails_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id + "\"></td><td><input type=\"text\" id=\"nombreProducto\" readonly=\"readonly\" value=\"" + data.nombre+"\"></td> <td><input id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes]["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td><td><input class=\"cantidadVender\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td><td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importe\" name=\"sale[saleDetails_attributes]["+index+"][importe]\" readonly=\"readonly\" type=\"text\" value=\"" + (data.precio * $("#cantidadlibro").val()) + "\"></td></tr>";

        /*for(var y = 0;y < document.forms.detallesVentaTable.clavelibro.length; y++)
        { 
          if(document.detallesVentaTable.clavelibro[y].value==index)
          { 
          //alert('Error campo vacio: [ " Se requiere una descripción " ]');
          alert("Se tiene registrado un libro con ese id"+ $("#clavelibro").val());
          //document.formulario.matricula[y].focus();
          return(false)
          }
        }*/          
          //CamposImput = formulario.getElementsByTagName("input"); 

          if (totalLibros >= cantidadlibrocompra) {
            var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_product_id\" name=\"sale[saleDetails_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id + "\"></td><td><input type=\"text\" id=\"nombreProducto\" readonly=\"readonly\" value=\"" + data.nombre+"\"></td> <td><input id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes]["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td><td><input class=\"cantidadVender\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td><td><input class=\"descuentoProducto\" id=\"sale_saleDetails_attributes_0_descuento\" name=\"sale[saleDetails_attributes]["+index+"][descuento]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) +"\"></td><td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importetotal\" name=\"sale[saleDetails_attributes]["+index+"][importetotal]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td></tr>";
          }else{
            alert("La venta no puede ser procesada, solo existen: "+totalLibros+" libros");  
          }

        $("#detallesVentaTable tbody").append(nuevoLibro);
        resetAgregaLibro();
        calculaTotales();        
        var c = new String();
        alert("Valor de ID " + ($('.idLibroVender').val()));
        var vid = $('.idLibroVender').val();
        c.add(vid);
        if (c.length != "") {
          alert("Este es un mensaje");
        }else{
          alert("Este es un mensaje incompleto");
        }
        var campos = $("#detallesVentaTable td .idLibroVender").length;   
        alert("Hemos entrado en el agreglo " + c.length);
          for (var i = 0; i < campos; i++) {            
            alert("Hemos entrado en el agreglo " + c[i]);   
          }          
        //$("#importeTotalDeVenta").val(((data.precio * $("#cantidadlibro").val()) - (totaldescuento)));
      }).fail(function(){
        resetAgregaLibro();
    });
  }

  function buscarCliente(rfc){
   if(rfc == "" || rfc == NaN)
    {
      alert("ingrese el nombre del cliente.");
      ocultarDatosCliente(); 
       $("#nombrecliente").val("");
        $("#apellidoscliente").val("");
        $("#direccioncliente").val("");
        $("#emailcliente").val("");
        $("#telefonocliente").val("");
        $("#facebookcliente").val("");
        $("#lynkedincliente").val("");    
      return;
    } 

    $.ajax({
    dataType: "json",
    url: "http://localhost:3000/clients/findRFC.json?rfc=" + rfc.toLowerCase() })
    .done(function(data) {
      if(data.id == null){
        alert("No se encontró el cliente."); 
        mostrarDatosCliente();
        $("#clavecliente").focus(); 
        $("#nombrecliente").val("");
        $("#apellidoscliente").val("");
        $("#direccioncliente").val("");
        $("#emailcliente").val("");
        $("#telefonocliente").val("");
        $("#facebookcliente").val("");
        $("#lynkedincliente").val("");            
        return;
      }
      else{
        //alert("Se ha encontrado un cliente.");    
        mostrarDatosCliente();
        $("#nombrecliente").val(data.nombre);
        $("#apellidoscliente").val(data.apellidos);
        $("#direccioncliente").val(data.direccion);
        $("#emailcliente").val(data.email);
        $("#telefonocliente").val(data.telefono);
        $("#facebookcliente").val(data.facebook);
        $("#lynkedincliente").val(data.lynkedin);

      }
    });
    
  }

  function resetAgregaLibro(){
    $("#cantidadlibro").val(1);
    $('#clavelibro').val("");
    $('#clavelibro').focus();
    $('#descuentolibro').val(0);
  }

  function calculaTotales(){
    var productos = 0;
    var descuento = 0;
    var importeTotal = 0;
    $(".cantidadVender").each(function(index){
      productos += parseInt($(this).val());
    });

    $(".importeProducto").each(function(index){
      importeTotal += parseFloat($(this).val());
    });

    $("#totalArts").html(productos);
    $("#importeTotalVenta").html(formatCurrency(importeTotal));    
    $("#importeTotalDeVenta").val(importeTotal);
  }

  //funcion tomada de http://selfcontained.us/2008/04/22/format-currency-in-javascript-simplified/
  function formatCurrency(num) {
    num = isNaN(num) || num === '' || num === null ? 0.00 : num;
    return "$ "+parseFloat(num).toFixed(2);
}
//Se acentan solo valores númericos
function validaNumeros() {
 if ((event.keyCode < 48) || (event.keyCode > 57)) 
  event.returnValue = false;
}
//Se aceptan solo letras M y m
function validaLetras() {
 if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122))
  event.returnValue = false;
}

function ocultarDatosCliente(){ 
  document.getElementById("cliente").style.display = "none";
  /*$(document).ready(function(){
   function fnOcultar(objDiv){
      $("#"+objDiv).css("display", "none"); 
   }
});*/
}

function mostrarDatosCliente(){ 
  document.getElementById("cliente").style.display = 'block';
    document.getElementById("nombrecliente").readonly;
    document.getElementById("apellidoscliente").style="readonly";
    document.getElementById("direccioncliente").style="readonly";
    document.getElementById("emailcliente").style="readonly";
    document.getElementById("telefonocliente").style="readonly";
    document.getElementById("facebookcliente").style="readonly";
    document.getElementById("lynkedincliente").style="readonly";
}

function valueCampo(){
  var el = document.getElementById("detallesVentaTable");
  var as = el.getElementsByTagName("idLibroVender"); 
  var campos = $("#detallesVentaTable td .idLibroVender").length;
  alert("tantos elementos de tr v campos" + campos);  
  alert("tantos elementos de tr v as" + as.length);  
  for (var i = 0; i < campos ; i++) {       
      alert("Elementos dentro del tr: " + campos[i]);
  };
  /*
    var el = document.getElementById("detallesVentaTable");
  var as = el.getElementById("idLibroVender"); 
  var campos = $("#detallesVentaTable td .idLibroVender").length 
  var idlibro = el.sale_saleDetails_attributes_0_product_id.value;
  alert("tantos elementos de tr v campos" + campos);  
  alert("tantos elementos de tr v as" + as.length);  
  alert("tantos elementos de tr v idLibro" + idlibro.innerHTML);  
  for (var i = 0; i < campos ; i++) {       
      alert("Elementos dentro del tr: " + campos[i]); 

  };


  /*
  for (var i = 0; i < $("#detallesVentaTable tbody tr").length ; i++) {      
    var campoId = $("#detallesVentaTable tbody tr").
      alert("tantos getElementById de tr" + i.val());  

      if(i == index){
        alert("Ya tenemos un libro con el mismo id");
      }else{
        alert("Debe ser un nuevo registro");
      }
  } */ 
}

function GetCampos(){

for(var i=0; i< CamposImput.length; i++) {  
// Si el tipo de campo es una caja de texto
if(CamposImput[i].val() == index) { 
  //if(ValidarCampo(CamposImput[i])==false);
  //return;
  alert("Ya tenemos un libro con el mismo id");
}
}
}
/*
function tipoCliente(){
  if (document.getElementById("checatipocliente").checked==true)) {    
    alert("hemos seleccionado el checkbox");
  }
}*/

function add(number1)
{
     var c = number1;
     document.write(" ---- Este valor añadido es ---- "+c);
      add(c);
}
=======
//= require turbolinks
//= require_tree .
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25
