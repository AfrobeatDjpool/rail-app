class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  # GET /rents
  # GET /rents.json
  def index
    if params[:name]
      @rents = Rent.search(params).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @rents = Rent.paginate(:page => params[:page], :per_page => 10)
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
    require 'csv'

    # @rent = Rent.new(rent_params)
     @rent = Rent.new


    rents = []
    if params[:file] 

      CSV.foreach(params[:file].tempfile, :headers => false, :encoding => 'ISO-8859-1').with_index { |row,index|
        # ["patente", "dv_patente", "marca", "modelo", "tipo", "fecha_ult_trans", "color", "resto_color", "ano_fab", "chasis", "numero_motor", "rut", "dv", "nombre", "multas"]
          if index != 0
            rent_data = {}
            rent_data["user_id"] = @current_user.try(:id)
            rent_data["patente"] = row[0]
            rent_data["dv_patente"] = row[1]
            rent_data["brand"] = row[2]
            rent_data["model"] = row[3]
            rent_data["tipo"] = row[4]
            rent_data["date_ult_trans"] = Time.at(row[5].to_i)
            rent_data["color"] = row[6]
            rent_data["rest_color"] = row[7]
            rent_data["ano_fab"] =  row[8]
            rent_data["chasis"] = row[9]
            rent_data["numero_motor"] = row[10]   
            rent_data["rut"] = row[11]
            rent_data["dv"] = row[12]
            rent_data["first_name"] = row[13]
            rent_data["fines"] = row[14]
            rent_data["date_of_db"] = row[15]       

            rents << rent_data
          end
      }
        #remove first row with column name and make a new array with rents
      # rents = rents[1..rents.length]
    end

    # @total_count = rents.count

    # if params[:count].blank?
    #   @count = 0
    # else
    #   @count = params[:count].to_i + 1
    # end

    # if !rents[@count].blank?
    #   puts rents[@count]
    #   @rent = Rent.create!(rents[@count])   
    #   @rent.save
    # end
      @rent = Rent.create!(rents)  
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

  def import
   
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
