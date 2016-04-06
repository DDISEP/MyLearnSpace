class PeerToPeerMessagesController < ApplicationController
  helper_method :current_user
  before_action :set_peer_to_peer_message, only: [:show, :edit, :update, :destroy]


  # GET /peer_to_peer_messages
  # GET /peer_to_peer_messages.json
  def index
    @peer_to_peer_messages = PeerToPeerMessage.where(reciever: @current_user.id)
  end

  # GET /peer_to_peer_messages/1
  # GET /peer_to_peer_messages/1.json
  def show
  end

  # GET /peer_to_peer_messages/new
  def new
    @peer_to_peer_message = PeerToPeerMessage.new
  end

  # GET /peer_to_peer_messages/1/edit
  def edit
  end

  # POST /peer_to_peer_messages
  # POST /peer_to_peer_messages.json
  def create
    @peer_to_peer_message = PeerToPeerMessage.new(params[:peer_to_peer_message])
      if @peer_to_peer_message.save
        redirect_to peer_to_peer_messages_path, notice: 'Deine Nachricht wurde abgeschickt.'
      else
        render "new.html.erb"
      end
  end

  # PATCH/PUT /peer_to_peer_messages/1
  # PATCH/PUT /peer_to_peer_messages/1.json
  def update
    @peer_to_peer_message = PeerToPeerMessage.find(params[:id])
    respond_to do |format|
      if @peer_to_peer_message.update(params[:peer_to_peer_message])
        format.html { redirect_to @peer_to_peer_message, notice: 'Deine Nachricht soll nicht geändert werden können.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @peer_to_peer_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peer_to_peer_messages/1
  # DELETE /peer_to_peer_messages/1.json
  def destroy
    @peer_to_peer_message.destroy
    respond_to do |format|
      format.html { redirect_to peer_to_peer_messages }
      format.json { head :no_content }
    end
  end

  def current_user
    @current_user.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer_to_peer_message
      @peer_to_peer_message = PeerToPeerMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_to_peer_message_params
      params.require(:peer_to_peer_message).permit(:sender, :reciever, :subject, :message)
    end

end
