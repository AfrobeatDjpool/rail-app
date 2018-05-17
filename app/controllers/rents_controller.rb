class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  # GET /rents
  # GET /rents.json
  def index
    if params[:name]
      @rents = Rent.search(params).order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
    else
      @rents = Rent.paginate(:page => params[:page], :per_page => 15)
    end
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents
  # POST /rents.json
  def create
    if params[:file]
      # ImportJob.perform_later params[:file].path, current_user
      ImportWorker.perform_async(params[:file].path, current_user)
      
    end    

    respond_to do |format|
      format.html { redirect_to"/rents", notice: 'Rent was successfully created.' }
      format.json { render :show, status: :created, location: @rent }
    end
    
  end

  # PATCH/PUT /rents/1
  # PATCH/PUT /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent.destroy
    respond_to do |format|
      format.html { redirect_to rents_url, notice: 'Rent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def chart
    if params[:type] == 'brand'
      @data = Rent.group(:brand).count.to_a.insert(0,["BRAND", "COUNT"])
    elsif params[:type] == 'model'
      @data = Rent.group(:model).count.to_a.insert(0,["MODEL", "COUNT"])
    elsif params[:type] == 'date_of_db'
      @data = Rent.group(:date_of_db).count.to_a.insert(0,["DATE OF DB", "COUNT"])
    elsif params[:type] == 'patente'
      @data = Rent.group(:patente).count.to_a.insert(0,["PATENTE", "COUNT"])
    elsif params[:type] == 'dv_patente'
      @data = Rent.group(:dv_patente).count.to_a.insert(0,["DV_PATENTE", "COUNT"])
    elsif params[:type] == 'typo'
      @data = Rent.group(:tipo).count.to_a.insert(0,["TYPE", "COUNT"])
    elsif params[:type] == 'date_ult_trans'
      @data = Rent.group(:date_ult_trans).count.to_a.insert(0,["Date ult trans", "COUNT"])
    elsif params[:type] == 'color'
      @data = Rent.group(:color).count.to_a.insert(0,["COLOR", "COUNT"])
    elsif params[:type] == 'rest_color'
      @data = Rent.group(:rest_color).count.to_a.insert(0,["REST COLOR", "COUNT"])
    elsif params[:type] == 'ano_fab'
      @data = Rent.group(:ano_fab).count.to_a.insert(0,["Ano FAB", "COUNT"])
    elsif params[:type] == 'chasis'
      @data = Rent.group(:chasis).count.to_a.insert(0,["CHASIS", "COUNT"])
    elsif params[:type] == 'numero_motor'
      @data = Rent.group(:numero_motor).count.to_a.insert(0,["Munbero MOTOR", "COUNT"])
    elsif params[:type] == 'rut'
      @data = Rent.group(:rut).count.to_a.insert(0,["RUT", "COUNT"])
    elsif params[:type] == 'dv'
      @data = Rent.group(:dv).count.to_a.insert(0,["DB", "COUNT"])
    elsif params[:type] == 'first_name'
      @data = Rent.group(:first_name).count.to_a.insert(0,["NAME", "COUNT"])
    elsif params[:type] == 'fines'
      @data = Rent.group(:fines).count.to_a.insert(0,["FINES", "COUNT"])
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_params
      params.require(:rent).permit(:user_id, :rut, :dv, :first_name, :cod_act, :email, :rank, :date_act, :origin)
    end
end
