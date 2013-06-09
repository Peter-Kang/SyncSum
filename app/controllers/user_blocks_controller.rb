class UserBlocksController < ApplicationController
  # GET /user_blocks
  # GET /user_blocks.json
  def index
    @user_blocks = UserBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_blocks }
    end
  end

  # GET /user_blocks/1
  # GET /user_blocks/1.json
  def show
    @user_block = UserBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_block }
    end
  end

  # GET /user_blocks/new
  # GET /user_blocks/new.json
  def new
    @user_block = UserBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_block }
    end
  end

  # GET /user_blocks/1/edit
  def edit
    @user_block = UserBlock.find(params[:id])
  end

  # POST /user_blocks
  # POST /user_blocks.json
  def create
    @user_block = UserBlock.new(params[:user_block])

    respond_to do |format|
      if @user_block.save
        format.html { redirect_to @user_block, notice: 'User block was successfully created.' }
        format.json { render json: @user_block, status: :created, location: @user_block }
      else
        format.html { render action: "new" }
        format.json { render json: @user_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_blocks/1
  # PUT /user_blocks/1.json
  def update
    @user_block = UserBlock.find(params[:id])

    respond_to do |format|
      if @user_block.update_attributes(params[:user_block])
        format.html { redirect_to @user_block, notice: 'User block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_blocks/1
  # DELETE /user_blocks/1.json
  def destroy
    @user_block = UserBlock.find(params[:id])
    @user_block.destroy

    respond_to do |format|
      format.html { redirect_to user_blocks_url }
      format.json { head :no_content }
    end
  end
end
