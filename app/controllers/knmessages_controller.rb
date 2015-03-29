class KnmessagesController < ApplicationController
  def index
    @knmessages = Knmessage.where("knowledge_element_id = ? and created_at > ?", params[:knowledge_element_id], Time.at(params[:after].to_i + 1))
  end

  def new
    @knmessage = Knmessage.new
  end

  def create
    @knmessage = Knmessage.new(params[:knmessage])
    @knmessage.name = @current_user.username
    if @knmessage.save
      flash[:notice] = "Nachricht wurde erfolgreich erstellt."
      redirect_to @knmessage.knowledge_element
    else
      render :action => 'new'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_knmessage
    @knmessage = Knmessage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def knmessage_params
    params.require(:knmessage).permit(:knowledge_element_id, :name, :content)
  end
end
