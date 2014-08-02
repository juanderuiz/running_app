$(document).ready(function(){
	//Muestra los comentarios
	$('.training').on('click','.vercomentarios',function(event){
	   event.preventDefault();//para que no haga scroll la página
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