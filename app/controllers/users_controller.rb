#encoding: utf-8

class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @my_id = 1 #いずれセッションを使う
    @user = User.find_by_id(params[:id])
    @is_following = Friend.is_following?(@my_id, params[:id])
    @following_count = Friend.num_of_following(params[:id])
    @followed_count = Friend.num_of_followed(params[:id])
  end

  def new
    @user = User.new
  end

  #
  #== ユーザの生成
  #
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render "new"
    end
  end
end
