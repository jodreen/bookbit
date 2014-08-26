class HexesController < ApplicationController
  before_action :set_hex, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  #Create = new and create
  #Read = show (ReadAll = index)
  #Update = edit and update
  #Destroy = destroy

  # GET /hexes
  # GET /hexes.json
  def index
    @hexes = Hex.all.order("created_at DESC")
  end

  # GET /hexes/1
  # GET /hexes/1.json
  def show
  end

  # GET /hexes/new
  # Action for button of "Create Pin"
  def new
    @hex = current_user.hexes.build
  end

  # GET /hexes/1/edit
  def edit
  end

  # POST /hexes
  # POST /hexes.json
  def create
    @hex = current_user.hexes.build(hex_params)

    if @hex.save
      redirect_to @hex, notice: 'Hex was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /hexes/1
  # PATCH/PUT /hexes/1.json
  def update
    if @hex.update(hex_params)
      redirect_to @hex, notice: 'Hex was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /hexes/1
  # DELETE /hexes/1.json
  def destroy
    @hex.destroy
    redirect_to hexes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hex
      @hex = Hex.find(params[:id])
    end

    def correct_user
      @hex = current_user.hexes.find_by(id: params[:id])
      redirect_to hexes_path if @hex.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hex_params
      params.require(:hex).permit(:description, :image)
    end
  end
