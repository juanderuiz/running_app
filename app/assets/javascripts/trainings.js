$(document).ready(function(){
	//Muestra los comentarios
	$('.training').on('click','.enlacecomentarios',function(event){
	   event.preventDefault();//para que no haga scroll la página
       $(this).hide();
       $(this).closest('.training').find('.comments').fadeToggle();
    });
    //Tiempo resaltado
    $('.training').on('mouseover','.time',function(){
    	$(this).css({'color':'#ffd','font-size':'14px'});
    });
    $('.training').on('mouseleave','.time',function(){
        $(this).css({'font-size':'16px'});
    });
}); 