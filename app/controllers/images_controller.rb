class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(create_params)

    if @image.save
      flash[:success] = 'Image Saved!'
      redirect_to @image
    else
      render :new, status: :bad_request
    end
  end

  def show
    @image = Image.find(params[:id])
    @tags_view_model = ApplicationView.new
  rescue StandardError
    redirect_to action: 'new'
  end

  def destroy
    Image.destroy(params[:id])
    flash[:success] = 'Image Deleted'
  rescue StandardError
    flash[:error] = 'Image not found'
  ensure
    redirect_to root_path
  end

  private

  def create_params
    params.require(:image).permit(:url, :tag_list)
  end
end
