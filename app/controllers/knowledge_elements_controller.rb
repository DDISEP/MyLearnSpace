class KnowledgeElementsController < ApplicationController

  def new
    @knowledgeElement = KnowledgeElement.new(knowledgeElement_params)

  end
end