# -*- coding: utf-8 -*-
require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class AuthTest < ::Test::Unit::TestCase
    context "With a valid api token, any request" do
      should "not raise an exception" do
        response = test_response({}, 200)
        @mock.expects(:get).once.returns(response)
        Rainforest::Test.retrieve("1")
      end
    end

    context "With an invalid api token, any request" do
      should "raise an exception" do
        response = test_response({error:"Authentication required"}, 401)
        assert_raises AuthenticationError do
          @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 401))
          Rainforest::Test.retrieve("1")
        end
      end
    end
  end
end
