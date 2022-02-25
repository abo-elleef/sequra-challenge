class CalculateMerchantsSisbursementsJob < ApplicationJob

  def perform(date = nil)
    scope = Order.where.not(completed_at: nil)
    scope = scope.where("completed_at > ?", date.beginning_of_week) if date.present?
    scope = scope.group(:merchant_id, "date_trunc('week',completed_at)").sum(:amount) 
    disbursements = scope.map do |key, value|
      {
        merchant_id: key[0], due_to: key[1],
        merchant_part: marchent_part(value), sequra_part: sequra_part(value)
      }
    end
    Disbursement.upsert_all(disbursements)
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
