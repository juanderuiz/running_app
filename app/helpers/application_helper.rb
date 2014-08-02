module ApplicationHelper

  def hms(seconds)
  	#Seconds -> Horas, minutos y segundos con operaciones matemáticas
  	if seconds <60
  		tiempo=[0,0,seconds]
  	elsif seconds < 3600
  		resultado=seconds.divmod(60)
  		tiempo = [0,resultado[0],resultado[1]]
    else
        resultado=seconds.divmod(3600)
        resto=resultado[1].divmod(60)
        tiempo = [resultado[0],resto[0],resto[1]]
    end
    #Ahora creamos la cadena del tipo 1h30'24"
    cadena=""
    if tiempo[0]>0
      cadena = cadena + tiempo[0].to_s + 'h'
    end
    if tiempo[1]>0 
      cadena = cadena + tiempo[1].to_s + '\''
    end
    if tiempo[2]>0
      cadena = cadena + tiempo[2].to_s + '"'
    end
    cadena
  end

end
