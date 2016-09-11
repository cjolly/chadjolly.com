class Pass < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :billing_ref
  validates_presence_of :valid_until

  def self.create_month!(email:, billing_ref:)
    create!(
      email: email,
      billing_ref: billing_ref,
      valid_until: 1.month.from_now
    )
  end
end
