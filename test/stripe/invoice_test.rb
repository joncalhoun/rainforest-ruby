require File.expand_path('../../test_helper', __FILE__)

module Rainforest
  class InvoiceTest < Test::Unit::TestCase
    should "retrieve should retrieve invoices" do
      @mock.expects(:get).once.returns(test_response(test_invoice))
      i = Rainforest::Invoice.retrieve('in_test_invoice')
      assert_equal 'in_test_invoice', i.id
    end

    should "pay should pay an invoice" do
      @mock.expects(:get).once.returns(test_response(test_invoice))
      i = Rainforest::Invoice.retrieve('in_test_invoice')

      @mock.expects(:post).once.with('https://api.rainforest.com/v1/invoices/in_test_invoice/pay', nil, '').returns(test_response(test_paid_invoice))
      i.pay
      assert_equal i.next_payment_attempt, nil
    end
  end
end
