class CurriculumsController < ApplicationController
  def index
    @users = Curriculum.all 
  end
end