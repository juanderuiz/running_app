$(document).on('ready page:load', function() {
	//Muestra la lista de entrenamientos en el Show del modelo Shoe
    $('#listaentrenos').on('click',function(event){
       event.preventDefault();//para que no haga scroll la página
       $(this).closest('#shoe').find('#entrenamientos_zapatilla').show();
    });
    $('#shoedata').on('mouseleave',function(event){
       event.preventDefault();//para que no haga scroll la página
       $(this).closest('#shoe').find('#entrenamientos_zapatilla').hide();
    });
});

