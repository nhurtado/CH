class UsdsController < ApplicationController
  before_action :set_usd, only: [:show, :edit, :update, :destroy]

  # GET /usds
  # GET /usds.json
  def index
    @usds = Usd.all
  end

  # GET /usds/1
  # GET /usds/1.json
  def show
  end

  # GET /usds/new
  def new
    @usd = Usd.new
  end

  # GET /usds/1/edit
  def edit
  end

  # POST /usds
  # POST /usds.json
  def create
    @usd = Usd.new(usd_params)

    respond_to do |format|
      if @usd.save
        format.html { redirect_to @usd, notice: 'Usd was successfully created.' }
        format.json { render :show, status: :created, location: @usd }
      else
        format.html { render :new }
        format.json { render json: @usd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usds/1
  # PATCH/PUT /usds/1.json
  def update
    respond_to do |format|
      if @usd.update(usd_params)
        format.html { redirect_to @usd, notice: 'Usd was successfully updated.' }
        format.json { render :show, status: :ok, location: @usd }
      else
        format.html { render :edit }
        format.json { render json: @usd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usds/1
  # DELETE /usds/1.json
  def destroy
    @usd.destroy
    respond_to do |format|
      format.html { redirect_to usds_url, notice: 'Usd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usd
      @usd = Usd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usd_params
      params.require(:usd).permit(:date_v, :value)
    end
end
