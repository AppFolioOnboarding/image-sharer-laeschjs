class ApplicationView
  def make_tags_for_one_image(image)
    ret = 'Tags: '
    image.tags.each do |tag|
      ret += ActionController::Base.helpers.link_to(
        tag.name, Rails.application.routes.url_helpers.root_path(
                    search: { tag: tag.name }
                  ), class: 'image_tag'
      )
      ret += ', ' unless image.tags.last.name == tag.name
    end
    ret
  end
end
