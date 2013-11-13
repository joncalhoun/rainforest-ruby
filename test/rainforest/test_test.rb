require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  # Dear god this name is odd.. :(   - jon
  class TestTest < Test::Unit::TestCase
    should "test should be retrievable" do
      title = "some test title"
      @mock.expects(:get).once.returns(test_response(test_test(title: title)))
      a = Rainforest::Test.retrieve
      assert_equal title, a.title
    end
  end
end
