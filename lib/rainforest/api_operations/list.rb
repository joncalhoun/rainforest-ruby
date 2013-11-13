module Rainforest
  module APIOperations
    module List
      module ClassMethods
        def all(filters={}, api_key=nil)
          response, api_key = Rainforest.request(:get, url, api_key, filters)
          # TODO(jon): Get rid of this self.class crap and get an object key in the hashes.
          Util.convert_to_rainforest_object(response, api_key, self.class.class_name.downcase)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
