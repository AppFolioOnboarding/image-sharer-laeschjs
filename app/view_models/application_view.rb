class ApplicationView
  def make_tags_for_one_image(image)
    ret = 'Tags: '
    array = %w[]
    image.tags.each do |tag|
      array = array.push(ActionController::Base.helpers.link_to(
                           tag.name, Rails.application.routes.url_helpers.images_path(
                                       search: { tag: tag.name }
                                     ), class: 'image_tag'
                         ))
    end
    ret + array.join(', ')
  end
end
