class RunnersController < ApplicationController
  before_action :authenticate_runner!, except: [:index]
  before_action :set_runner, only: [:show, :edit, :update, :destroy, :changepassword]

  # GET /runners
  # GET /runners.json
  def index
    @runners = Runner.all
  end

  # GET /runners/1
  # GET /runners/1.json
  def show
    @limite = 0
    @sesiones = []
    @total = 0
    @entrenos = []
    if @runner
      @limite = 10
      @sesiones = Training.where(:runner_id => @runner.id).order(date: :desc)
      @total = @sesiones.count(:all)
      @entrenos = @sesiones.limit(@limite)
      #@entrenos = Training.where(:runner_id => @runner.id).limit(@limite)
    end
    @training=Training.new #Para el formulario de Nuevo Entrenamiento en SHOW
  end

  # GET /runners/new
  def new
    @runner = Runner.new
  end

  # GET /runners/1/edit
  def edit
  end

  def changepassword
    respond_to do |format|
      if @runner.update(runner_params)
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(runner_params)

    respond_to do |format|
      if @runner.save
        format.html { redirect_to @runner, notice: 'Runner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @runner }
      else
        format.html { render action: 'new' }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runners/1
  # PATCH/PUT /runners/1.json
  def update
    respond_to do |format|
      if @runner.update(runner_params)
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.json
  def destroy
    @runner.destroy
    respond_to do |format|
      format.html { redirect_to runners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runner
      @runner = Runner.find_by_id(params[:id])
      @my_shoes = Shoe.where(runner_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runner_params
      params.require(:runner).permit(:name, :bio, :age, :country, :avatar, :email, :password, :password_confirmation)
    end
end
