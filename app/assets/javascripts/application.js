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
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require turbolinks
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
   $('#cantidadlibro').on("keypress",function(event) {
    //buscar el libro por codigo y agregarlo
    if ( event.which == 13)
    {
      agregaLibro($('#clavelibro').val());
      alert("Hemos presionado un enter en orden");
    }
  });

  //$('#checatipocliente').on("keypress",function(event) {
  //if (document.getElementById("checatipocliente").checked==true)) {    
    //alert("hemos seleccionado el checkbox");
  //}

});

function agregaLibro(isbn){
  var index = $(".idLibroVender").length;
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
        
          //CamposImput = formulario.getElementsByTagName("input"); 

          if (totalLibros >= cantidadlibrocompra) {
            var nuevoLibro = "<tr><td><input class=\"idLibroVender\" id=\"sale_saleDetails_attributes_0_product_id\" name=\"sale[saleDetails_attributes]["+index+"][product_id]\" readonly=\"readonly\" type=\"text\" value=\"" + data.id + "\"></td><td><input type=\"text\" id=\"nombreProducto\" readonly=\"readonly\" value=\"" + data.nombre+"\"></td> <td><input id=\"sale_saleDetails_attributes_0_preciounitario\" name=\"sale[saleDetails_attributes]["+index+"][preciounitario]\" readonly=\"readonly\" type=\"text\" value=\"" + data.precio + "\"></td><td><input class=\"cantidadVender\" id=\"sale_saleDetails_attributes_0_cantidad\" name=\"sale[saleDetails_attributes]["+index+"][cantidad]\" readonly=\"readonly\" type=\"text\" value=\"" + $("#cantidadlibro").val() + "\"></td><td><input class=\"descuentoProducto\" id=\"sale_saleDetails_attributes_0_descuento\" name=\"sale[saleDetails_attributes]["+index+"][descuento]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio / 100) * $("#descuentolibro").val()) +"\"></td><td><input class=\"importeProducto\" id=\"sale_saleDetails_attributes_0_importetotal\" name=\"sale[saleDetails_attributes]["+index+"][importetotal]\" readonly=\"readonly\" type=\"text\" value=\"" + ((data.precio * $("#cantidadlibro").val()) - (totaldescuento)) + "\"></td></tr>"; //<td><input type="checkbox" name="chk" id="chk" value=""></td>
            
          }else{
            alert("La venta no puede ser procesada, solo existen: "+totalLibros+" libros");  
          }

        $("#detallesVentaTable tbody").append(nuevoLibro);
        $("#detallesOrderTable tbody").append(nuevoLibro);
        resetAgregaLibro();
        calculaTotales();          
       
        //alert("Valor de ID " + ($('.idLibroVender').val()));
        var vid = $('.idLibroVender').val();                
        var campos = $("#detallesVentaTable").getElementById(".idLibroVender").length;   
        var datos = $("#detallesVentaTable td .idLibroVender").val();
        //alert("Filas: " + campos);
          for (var i = 1 ; i < campos ; i++) {            
            //alert("Hemos entrado en el agreglo " + datos[i]);   
          }                  
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
  

function add(number1){
  var c = number1;
  document.write(" ---- Este valor añadido es ---- "+c);
  add(c);
}

function Seleccionados(){
    var seleccion= $("#detallesVentaTable tbody tr input:checked").length;
    $("#seleccionados").html(seleccion);    
}

$("#eliminar").live("click", function(event){
  ("#chk:checked").each(function(index){
    var val=$(this).val();
    $("#c"+val).hide("slow", function(){
    $("#c"+val).remove();
   });
  });        
 Seleccionados();
});

//Al hacer click sobre una fila seleccionar el chekbox
$("#eliminar").live("click", function(event){
  alert("Hola en clic de eliminar");
    });

function seleccionarFilas(checkbox){
    checkbox.find("#chk").attr("checked", false);
    alert("Hola en click de checkbox");
}


    $(document).ready(function(){
        $('input[type="submit"]').attr('disabled','disabled');
        $('input[type="text"]').keypress(function(){
        if($(this).val() != ''){
            $('input[type="submit"]').removeAttr('disabled');
        }
     });
 });

