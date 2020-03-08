class WeekdaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weekday, only: [:show, :edit, :update, :destroy]

  # GET /weekdays
  # GET /weekdays.json
  def index
    @weekdays = current_user.weekdays.today
    @weekdays_all = current_user.weekdays
  end

  def historical
    @weekdays = current_user.weekdays
  end

  # GET /weekdays/1
  # GET /weekdays/1.json
  def show
  end

  # GET /weekdays/new
  def new
    @weekday = Weekday.new
    @weekday.record_times.build
  end

  # GET /weekdays/1/edit
  def edit
  end

  # POST /weekdays
  # POST /weekdays.json
  def create
    @weekday = Weekday.new(weekday_params)
  end

  # PATCH/PUT /weekdays/1
  # PATCH/PUT /weekdays/1.json
  def update
    respond_to do |format|
      if @weekday.update(weekday_params)
        format.html { redirect_to @weekday, notice: 'Weekday was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekday }
      else
        format.html { render :edit }
        format.json { render json: @weekday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekdays/1
  # DELETE /weekdays/1.json
  def destroy
    @weekday.destroy
    respond_to do |format|
      format.html { redirect_to weekdays_url, notice: 'Registro deleteado com sucesso.' }
      format.json { head :no_content }
    end
  end

  # POST /weekdays
  def add_time
    current_date = current_user.weekdays.today.first_or_create

    if current_date.record_times.count < 4
      current_date.record_times.create(time_stamp: Time.current)

      respond_to do |format|
        format.html { redirect_to weekdays_url, :flash => {:success => 'Registro realizado com sucesso!' } }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to weekdays_url, :flash => {:alert => 'Ops... Você ja registro 2 saidas e 2 entradas'} }
        format.json { head :no_content }
      end
    end
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekday
      @weekday = current_user.weekdays.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weekday_params
      params.require(:weekday).permit(:current_day).merge(user: current_user)
    end
end
