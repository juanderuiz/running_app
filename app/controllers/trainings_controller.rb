class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_filter :get_runner, except: [:main]
  #after_save :set_kms, only: [:create] #falta el update o no?
  #before_action :set_time, only: [:edit, :update]
  #before_action :get_shoes, only: [:create, :edit, :update]


  def main
    @trainings = Training.limit(12).order(date: :desc)
    #En el root muestro los 12 últimos entrenamientos, de quien sean
  end

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = @runner.trainings #.limit(16).order(date: :desc) #esto no funciona si son del mismo dia
    @training = Training.new
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    #Suficiente con el set_training en el before_action
  end

  # GET /trainings/new
  def new
    #@training = Training.new
    #redirect_to @runner
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = @runner.trainings.new(training_params)
    @training.time = set_time(training_params) #calculate the total amount of seconds with hours, minutes and seconds
    respond_to do |format|
      if @training.save
        if @training.shoe
           @training.shoe.add_kms(@training.kms)
        end
        format.html { redirect_to runner_trainings_path, notice: '¡Entrenamiento creado!' }
        format.json { render action: 'show', status: :created, location: @training } #Esto hay que cambiarlo creo
      else
        format.html { render action: 'new' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
      #format.js #Para el formulario de Nuevo Entrenamiento en el Show de Runner
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    #set_time
    #tiempoActual = @training.time
    zapatillaAnterior = @training.shoe
    if zapatillaAnterior
      logger.info("Zapatilla Anterior!!!!!!!!!!!!")
      logger.info(zapatillaAnterior.nombre)
    end
    kmsAnterior = @training.kms
    @training.time = set_time(training_params)
    respond_to do |format|
      if @training.update(training_params)
        logger.info("Zapatilla Nueva!!!!!!!!!!!!")
        zapatillaNueva = @training.shoe
        logger.info(zapatillaNueva.nombre)
        zapatillaNueva.add_kms(@training.kms) #Sumo los kms a la nueva zapatilla y salvo
        logger.info("Kilometros SUMADOS!!!!!!")
        if zapatillaAnterior
          zapatillaAnterior.subtract_kms(kmsAnterior) #Resto los kms del entreno anterior y salvo
          logger.info("Kilometros RESTADOS!!!!!!")
        end
        format.html { redirect_to runner_trainings_path, notice: 'Entreno actualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
      if @training.destroy
        if @shoe #si el entrenamiento tiene zapatilla registrada
          @shoe.subtract_kms(@training.kms) #Quito los kms a la zapatilla
        end
      
        respond_to do |format|
          format.html { redirect_to runner_trainings_path }
          format.json { head :no_content }
          format.js
        end
      else
        respond_to do |format|
          format.html { redirect_to runner_trainings_path, notice: 'No puedes borrar este entrenamiento' }
          format.json { head :no_content }
          #format.js
        end
      end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    def set_shoe
      @shoe = nil #shoe is undefined
      if @training.shoe_id
        @shoe = Shoe.find(@training.shoe_id)
      end     
    end

    def get_runner #también selecciona sus zapatillas disponibles
      @runner = Runner.find(params[:runner_id])
      @my_shoes = Shoe.where(runner_id: params[:runner_id])
    end

    def actualizarKms(zAnt,zNueva,kmsAnt,kmsNuevos)
      if (zAnt == nil) && (zNueva == nil)
          #nada que actualizar
      elsif (zAnt == nil) && (zNueva)
        zNueva.totalkms += kmsNuevos
        zNueva.save
      elsif (zNueva == nil) && (zAnt)
        zAnt.totalkms -= kmsAnt
        zAnt.save
      elsif (zAnt == zNueva) 
        zNueva.totalkms -= kmsAnt
        zNueva.totalkms += kmsNuevos
        zNueva.save
      elsif (zAnt != zNueva)
        zAnt.totalkms -= kmsAnt
        zNueva.totalkms += kmsNuevos
        zAnt.save
        zNueva.save
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:kms, :time, :date, :runner_id, :shoe_id, :description, :comments, :hours, :minutes, :seconds)
    end
 
    def set_time(t)
      #Calculate the amount of seconds
      time = (t[:hours].to_i)*3600 + (t[:minutes].to_i)*60 + (t[:seconds].to_i)
    end

end
