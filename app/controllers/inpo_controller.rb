class InpoController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  
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
    if Gameresult.find_by(user_id: @user) == nil
      @result = Gameresult.new
    else
      @result = Gameresult.where(user_id: @user).last
    end
    @wins = @result.wins
    @loses = @result.loses
  end
  
  def tutorial
  end
  
  def wingame
    
    @user = params[:id]
      
    if Gameresult.find_by(user_id: @user) == nil
      @result = Gameresult.new
      @result.user_id = @user
    else
      @result = Gameresult.where(user_id: @user).last
    end
    @result.wins += 1
    @result.loses -= 1
    @result.ladder += 20
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
    @result.ladder -= 10
    @result.save
  end
  
  def record
    @users = User.all
    @results = Gameresult.where(seasons: 1).order(ladder: :desc)
  end
  
  def contact
  end
  
  def submit
    @contact = Contact.new
    @contact.sender_email = params[:sender_email]
    @contact.category = params[:category]
    @contact.content = params[:content]
    
    
   respond_to do |format|
      if @contact.save
        format.html { "<script>alert('Submit!')</script>".html_safe }
        redirect_to '/inpo/contact'
      else
        format.html { redirect_to '/inpo/contact' }
      end
    end
  end
end
