class RunnersController < ApplicationController
  before_action :authenticate_runner!, except: [:index]
  before_action :set_runner, only: [:show, :edit, :update, :destroy]
  before_action :get_records, only: [:show]

  # GET /runners
  # GET /runners.json
  def index
    @runners = Runner.all
  end

  def trainings
    @trainings = Training.where(:runner_id => @runner.id).order(date: :desc)
  end  

  # GET /runners/1
  # GET /runners/1.json
  def show
    if @runner
      @total = @trainings.count(:all)
    end
  end

  # GET /runners/new
  def new
    @runner = Runner.new
  end

  # GET /runners/1/edit
  def edit
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(runner_params)
    @runner.datebirth = params[:datebirth]

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
      @trainings = @runner.trainings
      @age = ((Date.today - @runner.datebirth).to_f / 365).floor
    end

    def get_records
      @tipo = ["Maratón", "Media Maratón", "10k", "5k"]
      @records = {maraton: nil, media: nil, diezK: nil}
      @records[:maraton] = Training.where("runner_id = ? and description = ?", params[:id], @tipo[0]).order(time: :desc).last
      @records[:media] = Training.where("runner_id = ? and description = ?", params[:id], @tipo[1]).order(time: :desc).last 
      @records[:diezK] = Training.where("runner_id = ? and description = ?", params[:id], @tipo[2]).order(time: :desc).last
      @records[:cincoK] = Training.where("runner_id = ? and description = ?", params[:id], @tipo[3]).order(time: :desc).last

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runner_params
      params.require(:runner).permit(:name, :bio, :datebirth, :country, :avatar, :email, :password, :password_confirmation)
    end
end
