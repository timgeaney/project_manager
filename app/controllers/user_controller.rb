class UserController < ApplicationController

  before_filter :authenticate, :only => :show

  def index
    @user = [
      'luke-skywalker',
      'darth-vader'
    ]
  end

  def show
    @person = params[:id]
  end


  private

  def authenticate
    if params[:id] == "darth-vader"
      redirect_to user_index_path, :notice => "That page is restricted."
    end
  end

end
