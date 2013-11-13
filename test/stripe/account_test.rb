require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class AccountTest < Test::Unit::TestCase
    should "account should be retrievable" do
      resp = {:email => "test+bindings@rainforest.com", :charge_enabled => false, :details_submitted => false}
      @mock.expects(:get).once.returns(test_response(resp))
      a = Rainforest::Account.retrieve
      assert_equal "test+bindings@rainforest.com", a.email
      assert !a.charge_enabled
      assert !a.details_submitted
    end
  end
end
