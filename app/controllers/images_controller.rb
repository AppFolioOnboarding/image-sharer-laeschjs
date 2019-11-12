class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @images = Image.all
    @filter_is_on = false
    flash[:notice] = ''
    @application_view_model = ApplicationView.new

    check_search(params)

    @images = @images.reverse
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
  rescue ActiveRecord::RecordNotFound
    redirect_to action: 'new'
  end

  def destroy
    Image.destroy(params[:id])
    flash[:success] = 'Image Deleted'
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Image not found'
  ensure
    redirect_to images_path
  end

  private

  def create_params
    params.require(:image).permit(:url, :tag_list)
  end

  def check_search(params)
    search = params['search']
    return unless search.present?

    @tag = search['tag']
    @images = Image.tagged_with(@tag)
    flash[:notice] = "There are no images with '#{@tag}' as a tag" if @images.count.zero?
    @filter_is_on = true
  end
end
