# -*- coding: utf-8 -*-
require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class ApiResourceTest < ::Test::Unit::TestCase
    should "creating a new APIResource should not fetch over the network" do
      @mock.expects(:get).never
      c = Rainforest::Run.new("someid")
    end
  end
end
