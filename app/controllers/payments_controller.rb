class PaymentsController < ApplicationController
  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
    @total= params[:totalprice]


  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
   @cart=ProductOrder.where(shopping_cart_id: session[:cartid]).map(&:order).select{ |f| f.orderstatus !='Paid' }
   

    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true
      }
      )

    if result.success? || result.transaction
      redirect_to payment_path(id: result.transaction.id)
      
      @cart.each do |f| 
        f.update_attributes(orderstatus: 'Paid')
      end
      
      mail = SalesMailer.new_sales(current_user.email,'Receipt for Your Payment','You made a transaction of $' + amount + "via " + nonce)
      mail.deliver_now
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      #mail=SalesMailer.new_sales(current_user.email,'Transaction Failed', "Your test transaction has a status of #{status}")

      flash[:error] = error_messages
      redirect_to new_payment_path
    end

    
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Congratulations Payment is completed!",
        :icon => "success",
        :message => "Your test transaction has been successfully processed."
      }
    else
      result_hash = {
        :header => "Transaction Failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
      }
    end
  end

  def order_item_status
    params.require(:order).permit(:order_status)
  end
end