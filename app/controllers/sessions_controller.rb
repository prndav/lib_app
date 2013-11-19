class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    login = Login.new(login_params)

    session[:reader_id] = login.authenticate
    redirect_to root_url, notice: 'Its working, yeah'
  end

  private

    def login_params
      params.require(:login).permit(:email, :password)
    end
end
