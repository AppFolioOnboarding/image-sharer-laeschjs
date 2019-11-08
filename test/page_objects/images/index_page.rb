module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '#all_images', item_locator: '.image_card', contains: ImageCard do
        def view!
          node.find('.image_link').click
          stale!
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('Upload an Image')
        stale!
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |image|
          image.url == url && (tags.nil? || check_tags(tags, image))
        end
      end

      def clear_tag_filter!
        node.click_on('Clear filter')
        stale!
        window.change_to(IndexPage)
      end

      private

      def check_tags(tags, image)
        image.tags.each_with_index do |tag, index|
          return false unless tag == tags[index]
        end
        true
      end
    end
  end
end
