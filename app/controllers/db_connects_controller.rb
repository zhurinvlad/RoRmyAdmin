class DbConnectsController < ApplicationController
  before_action :set_db_connect, only: [:show, :edit, :update, :destroy]

  # GET /db_connects
  # GET /db_connects.json
  def index
    @db_connects = DbConnect.all
  end

  # GET /db_connects/1
  # GET /db_connects/1.json
  def show
  end

  # GET /db_connects/new
  def new
    @db_connect = DbConnect.new
  end

  # GET /db_connects/1/edit
  def edit
  end

  # POST /db_connects
  # POST /db_connects.json
  def create
    @db_connect = DbConnect.new(db_connect_params)

    respond_to do |format|
      if @db_connect.save
        format.html { redirect_to db_connects_url, notice: 'Подключение успешно создано.' }
        format.json { render :show, status: :created, location: @db_connect }
      else
        format.html { render :new }
        format.json { render json: @db_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /db_connects/1
  # PATCH/PUT /db_connects/1.json
  def update
    respond_to do |format|
      if @db_connect.update(db_connect_params)
        format.html { redirect_to db_connects_url, notice: 'Подключение успешно обновлено.' }
        format.json { render :show, status: :ok, location: @db_connect }
      else
        format.html { render :edit }
        format.json { render json: @db_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db_connects/1
  # DELETE /db_connects/1.json
  def destroy
    @db_connect.destroy
    respond_to do |format|
      format.html { redirect_to db_connects_url, notice: 'Подключение было уничтожено.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_db_connect
      @db_connect = DbConnect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def db_connect_params
      params.require(:db_connect).permit(:data_base, :username, :password)
    end
end
