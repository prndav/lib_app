class ReadersController < ApplicationController
  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)

    if @reader.save
      flash[:notice] = 'You registered!'
      redirect_to root_url
    else
      flash[:error] = 'Error!'
      render :new
    end
  end

  private

    def reader_params
      params.require(:reader).permit(:email, :password, :password_confirmation)
    end

end
