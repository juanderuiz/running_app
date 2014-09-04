$(document).ready(function(){
    // EVENT HANDLERS
    //Muestra los comentarios en el mouseover
    $('.training').on('mouseover','.enlacecomentarios', muestraComentario);
    //Quita los comentarios en el mouseleave
    $('.training').on('mouseleave','.comments', undoMuestraComentario);
    //Para cambiar el fondo del campo kilometros segun la distancia, usando cambiarColor ---> addClass??
    colorEntreno();
}); 

//Helper methods

function muestraComentario(event){
  event.preventDefault();//para que no haga scroll la página
  $(this).hide();
  $(this).closest('.centro').find('.description').css({'display':'none'});
  $(this).closest('.comentarios').css({'width':'100%'});
  $(this).closest('.comentarios').find('.comments').css({'color':'yellow'}).fadeToggle();
}

function undoMuestraComentario(event){
 event.preventDefault();//para que no haga scroll la página
  $(this).hide();
  $(this).closest('.comentarios').find('.enlacecomentarios').fadeToggle();
  $(this).closest('.comentarios').css({'width':'64%'});
  $(this).closest('.centro').find('.description').css({'display':'inline-block'}); 
}

function cambiarColor(){
  var distancia = $(this).data('kms');
  if (distancia<12.01){
    $(this).css({'background-color':'green'});
  } else if (distancia<16){
    $(this).css({'background-color':'yellow', 'color': '#bbb'});
  } else if (distancia<22){
    $(this).css({'background-color':'orange'});
  } else if (distancia>35) {
    $(this).css({'background-color':'#011'});
  }
}

function colorEntreno(){
    var entrenos = [];
    entrenos = $('.kms');//Cojo los elementos con una clase kms
    console.log(entrenos.length);
    entrenos.each(cambiarColor);
}

