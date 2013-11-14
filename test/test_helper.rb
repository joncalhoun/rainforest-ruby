$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require 'rainforest'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda'

#monkeypatch request methods
module Rainforest
  @mock_rest_client = nil

  def self.mock_rest_client=(mock_client)
    @mock_rest_client = mock_client
  end

  def self.execute_request(opts)
    get_params = (opts[:headers] || {})[:params]
    post_params = opts[:payload]
    case opts[:method]
    when :get then @mock_rest_client.get opts[:url], get_params, post_params
    when :post then @mock_rest_client.post opts[:url], get_params, post_params
    when :delete then @mock_rest_client.delete opts[:url], get_params, post_params
    end
  end
end

def test_response(body, code=200)
  # When an exception is raised, restclient clobbers method_missing.  Hence we
  # can't just use the stubs interface.
  body = MultiJson.dump(body) if !(body.kind_of? String)
  m = mock
  m.instance_variable_set('@rainforest_values', { :body => body, :code => code })
  def m.body; @rainforest_values[:body]; end
  def m.code; @rainforest_values[:code]; end
  m
end

def test_test(params={})
  {
    id: 2181,
    object: "Test",
    created_at: "2013-11-05T04:57:55Z",
    test_id: 2181,
    site_id: 860,
    title: "shit works",
    result: "no_result",
    start_uri: "/ghost/signin",
    run_mode: "default",
    deleted: false,
    deletable: true,
    editable: true,
    browsers: [
      {
        name: "chrome",
        state: "enabled"
      },{
        name: "firefox",
        state: "enabled"
      },{
        name: "ie8",
        state: "enabled"
      },{
        name: "ie9",
        state: "enabled"
      },{
        name: "safari",
        state: "enabled"
      }
    ],
    tags: [],
    dry_run_url: "https://fierce-thicket-5713.herokuapp.com/turker/dry_run/L4nI_HqGn6ZT4fvecPmDng?turkSubmitTo=%2Fthanks",
    last_run: {
      id: 4244,
      created_at: "2013-11-13T14:38:01Z",
      state: "in_progress"
    }
  }.merge(params)
end

def test_run(params={})
  {
    id: 4244,
    object: "Run",
    created_at: "2013-11-13T14:38:01Z",
    environment_id: 1144,
    test_count: 1,
    state_log: [
      {
        id: 11741379,
        created_at: "2013-11-13T14:38:04Z",
        event: "validate_run!",
        from: "queued",
        state_column: "state",
        stateful_id: 4244,
        stateful_type: "Run",
        to: "validating",
        transitioned_at: "2013-11-13T14:38:04Z",
        updated_at: "2013-11-13T14:38:04Z"
      },{
        id: 11741378,
        created_at: "2013-11-13T14:38:04Z",
        event: "validated!",
        from: "validating",
        state_column: "state",
        stateful_id: 4244,
        stateful_type: "Run",
        to: "in_progress",
        transitioned_at: "2013-11-13T14:38:04Z",
        updated_at: "2013-11-13T14:38:04Z"
      }
    ],
    state: "in_progress",
    result: "no_result",
    expected_wait_time: 5400.0,
    browsers: [
      {
        name: "chrome",
        state: "enabled"
      },{
        name: "firefox",
       state: "enabled"
      },{
        name: "ie8",
        state: "enabled"
      },{
        name: "ie9",
        state: "enabled"
      },{
        name: "safari",
        state: "enabled"
      }
    ],
    requested_tests: [2181]
  }.merge(params)
end

def test_run_array
  {
    data: [test_run, test_run, test_run],
    url: '/1/runs'
  }
end

class Test::Unit::TestCase
  include Mocha

  setup do
    @mock = mock
    Rainforest.mock_rest_client = @mock
    Rainforest.api_key="foo"
  end

  teardown do
    Rainforest.mock_rest_client = nil
    Rainforest.api_key=nil
  end
end

