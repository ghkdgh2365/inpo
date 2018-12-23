class InpoController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: [:play2]
  def index
  end
  
  def battle
  end
  
  def license
  end
  
  def battle2
  end
  def dump
  end
  
  def play
  end
  
  def play2
    @user = current_user.id
    @user_email = current_user.email
    @result = Gameresult.where(user_id: @user).last
    @wins = @result.wins
    @loses = @result.loses
    
  end
  
  def wingame
    @user = params[:id]
      
    if Gameresult.find_by(user_id: @user) == nil
      @result = Gameresult.new
    else
      @result = Gameresult.where(user_id: @user).last
    end
    @result.user_id = @user
    @result.wins += 1
    @result.loses -= 1
    @result.save
      
  end
  
  def losegame
    @user = params[:id]
    if Gameresult.find_by(user_id: @user) == nil
      @result = Gameresult.new
    else
      @result = Gameresult.where(user_id: @user).last
    end
    @result.user_id = @user
    @result.loses += 1
    @result.save
  end
end
