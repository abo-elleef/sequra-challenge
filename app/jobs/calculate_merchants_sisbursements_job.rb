class CalculateMerchantsSisbursementsJob < ApplicationJob

  def perform(date:)
    grouped_disbursements = Order.where.not(completed_at: nil)
      .group(:merchant_id, "date_trunc('week',completed_at)").sum(:amount)
    disbursements = grouped_disbursements.map do |key, value|
      {
        merchant_id: key[0], due_to: key[1],
        merchant_part: marchent_part(value), sequra_part: sequra_part(value)
      }
    end
    Disbursement.upsert_all(disbursements)
    # TODO: retries 
    # TODO: RAM issues
  end


  private 

  def sequra_part(value)
    value * sequra_percentag(value)
  end

  def marchent_part(value)
    value - sequra_part(value)
  end

  def sequra_percentag(amount)
    return 0.01 if amount < 50 
    return 0.0095 if amount <= 300
    return 0.0085
  end
end
