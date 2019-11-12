module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image, locator: '#new_image' do
        element :url, locator: '#image_url'
        element :tags, locator: '#image_tag_list'
      end

      def create_image!(url: nil, tags: nil)
        image.url.set url unless url.nil?
        image.tags.set tags unless tags.nil?
        node.click_on('Save Image')
        stale!
        window.change_to(ShowPage, NewPage)
      end
    end
  end
end
