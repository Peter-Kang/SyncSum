class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  layout "two_column"
  def index
    @messages = Message.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @messages }
    #end
  end

  # GET /messages/1
  # GET /messages/1.json
  def display
    @message = Message.find(params[:id])
	@message.update_attribute(:isRead, true)
  end
  
  # GET /messages/1
  # GET /messages/1.json
  def show
    if params[:id].downcase != "dashboard"
    @message = Message.find(params[:id])
	@message.update_attribute(:isRead, true)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(params[:message])
	@message.recipientID = User.where("username = ?", params[:recipientID]).name
	
	
    respond_to do |format|
      if @message.save
        format.html { redirect_to inbox_messages_path, notice: 'Message was successfully sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
	
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

	redirect_to :action => "inbox"
    
  end
  
  def inbox
	@messages = Message.where(:recipientID => current_user.email)
	@unRead = Message.where(:recipientID => current_user.email, :isRead => false)
  end
  def compose
	@message = Message.new
  end
end
