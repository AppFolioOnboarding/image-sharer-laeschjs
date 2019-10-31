class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(create_params)

    if @image.save
      flash[:notice] = 'success'
      redirect_to @image
    else
      render :new, status: :bad_request
    end
  end

  def show
    @image = Image.find(params[:id])
  rescue StandardError
    redirect_to action: 'new'
  end

  private

  def create_params
    params.require(:image).permit(:url)
  end
end
