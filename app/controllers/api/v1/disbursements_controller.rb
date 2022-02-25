class Api::V1::DisbursementsController < ApplicationController
  def index
    if date_params_exists?
      render(json:{disbursements: disbursements}, status: :ok)
    else
      render(json:{message: 'Missing Date Input'},  status: :unprocessable_entity) && return 
    end
    
    
    
  end

  private

  def date_params_exists?
    params[:date].present?
  end

  def disbursements
    date = Date.parse(params[:date]).beginning_of_week
    scope = Disbursement.where(due_to: date)
    scope = scope.where(merchant_id: params[:merchant_id]) if params[:merchant_id].present?
    scope.all.order([:due_to, :merchant_id])
  end
end
