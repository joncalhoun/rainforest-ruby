require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class RunTest < ::Test::Unit::TestCase
    should "be listable" do
      @mock.expects(:get).once.returns(test_response(test_run_array))
      runs = Rainforest::Run.all
      assert runs.data.kind_of? Array

      runs.data.each do |run|
        assert run.kind_of?(Rainforest::Run)
      end
    end

    should "be retrievable individually" do
      @mock.expects(:get).once.returns(test_response(test_run))
      run = Rainforest::Run.retrieve("test_run")
      assert run.kind_of?(Rainforest::Run)
    end

    should "be abortable" do
      @mock.expects(:get).once.returns(test_response(test_run))
      @mock.expects(:delete).once.returns(test_response(test_run(state: "aborted")))
      run = Rainforest::Run.retrieve("test_run")
      run = run.delete

      assert_equal("aborted", run.state)
    end

    should "be createable" do
      @mock.expects(:post).once.returns(test_response(test_run))
      run = Rainforest::Run.create(tests: ["all"])
      assert run.kind_of?(Rainforest::Run)
    end
  end
end
