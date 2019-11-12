module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        node.find('#image_url').text.split(' ')[1]
      end

      def tags
        node.find('.image_tag').text.split(' ')
      end

      def delete
        node.click_on('Delete Image')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        delete(&:accept)
        stale!
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('See all images')
        stale!
        window.change_to(IndexPage)
      end
    end
  end
end
