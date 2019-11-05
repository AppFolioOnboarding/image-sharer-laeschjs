class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @images = Image.all.reverse
    @filter_is_on = false
    flash[:notice] = ''
    @application_view_model = ApplicationView.new

    search = params['search']
    return unless search.present?

    @tag = search['tag']
    @images = Image.tagged_with(@tag)
    flash[:notice] = "There are no images with '#{@tag}' as a tag" if @images.count.zero?
    @filter_is_on = true
  end
end
