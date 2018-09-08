class DateValuesController < ApplicationController
  before_action :set_date_value, only: [:show, :edit, :update, :destroy]

  # GET /date_values
  # GET /date_values.json
  def index
    @date_values = DateValue.all
  end

  # GET /date_values/1
  # GET /date_values/1.json
  def show
  end

  # GET /date_values/new
  def new
    @date_value = DateValue.new
  end

  # GET /date_values/1/edit
  def edit
  end

  # POST /date_values
  # POST /date_values.json
  def create
    @date_value = DateValue.new(date_value_params)

    respond_to do |format|
      if @date_value.save
        format.html { redirect_to @date_value, notice: 'Date value was successfully created.' }
        format.json { render :show, status: :created, location: @date_value }
      else
        format.html { render :new }
        format.json { render json: @date_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_values/1
  # PATCH/PUT /date_values/1.json
  def update
    respond_to do |format|
      if @date_value.update(date_value_params)
        format.html { redirect_to @date_value, notice: 'Date value was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_value }
      else
        format.html { render :edit }
        format.json { render json: @date_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_values/1
  # DELETE /date_values/1.json
  def destroy
    @date_value.destroy
    respond_to do |format|
      format.html { redirect_to date_values_url, notice: 'Date value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_value
      @date_value = DateValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_value_params
      params.require(:date_value).permit(:date_v, :uf, :usd, :gold)
    end
end
