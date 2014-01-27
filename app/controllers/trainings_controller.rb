class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_filter :get_runner, except: [:main]

  def get_runner
    @runner = Runner.find(params[:runner_id])
  end

  def main
    @trainings = Training.order(date: :desc).limit(15)
    #En el root muestro los 15 últimos entrenamientos, de quien sean
  end

  # GET /trainings
  # GET /trainings.json
  def index
    #@trainings = Training.order('created_at DESC').limit(10)
    #@trainings = Training.includes(:runner).order('created_at DESC').limit(10)
    @trainings = @runner.trainings.order(date: :desc).limit(10) #esto no funciona si son del mismo dia
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    #@training = Training.find(params[:id])
    @training = @runner.trainings.find(params[:id])
    #@corredor = Runner.find(@training.runner_id)
    @corredor = @runner
   # render :action => 'status'
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = @runner.trainings.new(training_params)
    set_time
    respond_to do |format|
      if @training.save
        format.html { redirect_to [@runner, @training], notice: 'Entrenamiento creado' }
        format.json { render action: 'show', status: :created, location: @training } #Esto hay que cambiarlo creo
      else
        format.html { render action: 'new' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    set_time
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'Training was successfully updated.' }
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
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:kms, :time, :date, :runner_id, :description, :comments, :hours, :minutes, :seconds)
    end

    def set_time
      @training.time = (@training.hours*3600)+(@training.minutes*60)+@training.seconds
    end
end
