class Pass < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :billing_ref
  validates_presence_of :valid_until

  def self.create_24hr!(email:, billing_ref:)
    create!(
      email: email,
      billing_ref: billing_ref,
      valid_until: 24.hours.from_now
    )
  end
end
