module Rainforest
  class Test < APIResource
    include Rainforest::APIOperations::Create
    include Rainforest::APIOperations::Delete
    include Rainforest::APIOperations::Update
    include Rainforest::APIOperations::List
  end
end
