module Rainforest
  module APIOperations
    module Delete
      def delete
        response, api_key = Rainforest.request(:delete, url, @api_key)
        refresh_from(response, api_key)
        self
      end
    end
  end
end
