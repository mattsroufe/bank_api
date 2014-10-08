class Customer < ActiveRecord::Base
  self.table_name = "customer"

  has_many :accounts, :foreign_key => :cust_id
  has_one :business, :foreign_key => :cust_id
  has_one :individual, :foreign_key => :cust_id

  delegate :name, :to => :business, :prefix => true, :allow_nil => true
  delegate :name, :to => :individual, :prefix => true, :allow_nil => true

  def name
    individual_name || business_name
  end

  def self.with_accounts
    includes(:accounts, :business, :individual).
    as_json(
      :methods => :name,
      :include => [
        :accounts
      ]
    )
  end
end
