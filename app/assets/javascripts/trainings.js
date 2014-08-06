$(document).ready(function(){
	//Muestra los comentarios en el OnOver
	$('.training').on('mouseover','.enlacecomentarios',function(event){
	   event.preventDefault();//para que no haga scroll la página
       $(this).hide();
       $(this).closest('.comentarios').find('.comments').css({'color':'yellow'}).fadeToggle();
    });
    $('.training').on('mouseleave','.comments',function(event){
       event.preventDefault();//para que no haga scroll la página
       $(this).hide();
       $(this).closest('.comentarios').find('.enlacecomentarios').fadeToggle();
    });
    //Tiempo resaltado
    $('.training').on('mouseover','.time',function(){
    	$(this).css({'color':'#ffd','font-size':'17px'});
    });
    $('.training').on('mouseleave','.time',function(){
        $(this).css({'font-size':'16px'});
    });
}); 