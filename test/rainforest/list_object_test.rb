require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ListObjectTest < ::Test::Unit::TestCase
    should "be able to retrieve full lists given a listobject" do
      @mock.expects(:get).twice.returns(test_response(test_run_array))
      c = Rainforest::Run.all
      assert c.kind_of?(Rainforest::ListObject)
      assert_equal('/1/runs', c.url)
      all = c.all
      assert all.kind_of?(Rainforest::ListObject)
      assert_equal('/1/runs', all.url)
      assert all.data.kind_of?(Array)
    end
  end
end
