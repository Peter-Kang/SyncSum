class BusinessSectorsController < ApplicationController
  # GET /business_sectors
  # GET /business_sectors.json
  def index
    @business_sectors = BusinessSector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_sectors }
    end
  end

  # GET /business_sectors/1
  # GET /business_sectors/1.json
  def show
    @business_sector = BusinessSector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_sector }
    end
  end

  # GET /business_sectors/new
  # GET /business_sectors/new.json
  def new
    @business_sector = BusinessSector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_sector }
    end
  end

  # GET /business_sectors/1/edit
  def edit
    @business_sector = BusinessSector.find(params[:id])
  end

  # POST /business_sectors
  # POST /business_sectors.json
  def create
    @business_sector = BusinessSector.new(params[:business_sector])

    respond_to do |format|
      if @business_sector.save
        format.html { redirect_to @business_sector, notice: 'Business sector was successfully created.' }
        format.json { render json: @business_sector, status: :created, location: @business_sector }
      else
        format.html { render action: "new" }
        format.json { render json: @business_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_sectors/1
  # PUT /business_sectors/1.json
  def update
    @business_sector = BusinessSector.find(params[:id])

    respond_to do |format|
      if @business_sector.update_attributes(params[:business_sector])
        format.html { redirect_to @business_sector, notice: 'Business sector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_sectors/1
  # DELETE /business_sectors/1.json
  def destroy
    @business_sector = BusinessSector.find(params[:id])
    @business_sector.destroy

    respond_to do |format|
      format.html { redirect_to business_sectors_url }
      format.json { head :no_content }
    end
  end
end
