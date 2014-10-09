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

  def as_json(options = {})
    super(
      :methods => [
        :name
      ]
    )
  end

  def self.with_accounts
    includes(:business, :individual, :accounts => [:transactions, :product]).
    as_json(
      :methods => :name,
      :only => [:cust_id, :fed_id, :address, :city, :state, :postal_code],
      :include => [
        :business,
        :accounts => {
          :include => [
            :transactions,
            :product
          ]
        }
      ]
    )
  end
end
