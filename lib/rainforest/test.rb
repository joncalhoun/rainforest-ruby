module Rainforest
  class Test < APIResource
    include Rainforest::APIOperations::Create
    include Rainforest::APIOperations::Delete
    include Rainforest::APIOperations::Update
    include Rainforest::APIOperations::List

    def self.tags(filters={}, api_key=nil)
      response, api_key = Rainforest.request(:get, url + "/tags", api_key, filters)
      response
    end

  end
end
