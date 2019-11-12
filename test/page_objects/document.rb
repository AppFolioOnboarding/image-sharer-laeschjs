module PageObjects
  class Document < AePageObjects::Document
    def flash_message(message_type)
      node.find('#flash_success_message').text if message_type == :success
    end
  end
end
