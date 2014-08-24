require 'will_paginate/array'

class CommentsController < ApplicationController
  
  before_action :get_comment, only: [:show, :destroy, :edit, :update, :authenticate]
  
  before_action :get_exercise, only: [:show, :edit, :update, :create, :destroy]
  
  before_action :check_auth, only:[:update, :destroy]
  
  def check_auth
    if @exercise.user_id != session[:current_user_id] && session[:admin] != true then
      flash[:notice] = "Du bist weder Administrator, noch Autor deses Kommentars!"
      redirect_to @exercise
    end
  end
  
  def get_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end
  
  def get_comment
    @comment = Comment.find(params[:id])
  end
  
  def show
  end

  def new
  end

  def edit  # even admin isn't allowed to edit comments, he/she may only delete it
    if @exercise.user_id != session[:current_user_id] then
      flash[:notice] = "Nur der Autor eines Kommentars darf diesen ändern!"
      redirect_to @exercise
    end
  end

  def update
    @comment.text = params[:comment][:text]
    @comment.save
  end

  def create
    @comment = Comment.new              # for some (unknown) reason mass assignment via create didn't work
    @comment.exercise_id = params[:exercise_id]
    @comment.user_id = session[:current_user_id]
    @comment.text = params[:comment][:text]
    @comment.save
    @comments = @exercise.comments.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @page = params[:page].nil? ? 1 : params[:page]
  end
  
  def index
    @comments=Comment.all
  end
  
  def destroy
    @comment.destroy
    @exercise.comments.reload         # reload to make sure that destroyed comment isn't included
    @comments = @exercise.comments.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @page = params[:page].nil? ? 1 : params[:page]
  end
  
  
end
