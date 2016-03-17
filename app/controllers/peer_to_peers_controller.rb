class PeerToPeersController < ApplicationController
  before_action :set_peer_to_peer, only: [:show, :edit, :update, :destroy]

  # GET /peer_to_peers
  # GET /peer_to_peers.json
  def index
    @peer_to_peers = PeerToPeer.all
  end

  # GET /peer_to_peers/1
  # GET /peer_to_peers/1.json
  def show
  end

  # GET /peer_to_peers/new
  def new
    @peer_to_peer = PeerToPeer.new
  end

  # GET /peer_to_peers/1/edit
  def edit
  end

  # POST /peer_to_peers
  # POST /peer_to_peers.json
  def create
    @peer_to_peer = PeerToPeer.new(peer_to_peer_params)

    respond_to do |format|
      if @peer_to_peer.save
        format.html { redirect_to @peer_to_peer, notice: 'Peer to peer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @peer_to_peer }
      else
        format.html { render action: 'new' }
        format.json { render json: @peer_to_peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peer_to_peers/1
  # PATCH/PUT /peer_to_peers/1.json
  def update
    respond_to do |format|
      if @peer_to_peer.update(peer_to_peer_params)
        format.html { redirect_to @peer_to_peer, notice: 'Peer to peer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @peer_to_peer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peer_to_peers/1
  # DELETE /peer_to_peers/1.json
  def destroy
    @peer_to_peer.destroy
    respond_to do |format|
      format.html { redirect_to peer_to_peers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer_to_peer
      @peer_to_peer = PeerToPeer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_to_peer_params
      params.require(:peer_to_peer).permit(:sender, :receiver, :subject, :message)
    end
end
