class Business < ActiveRecord::Base
  self.table_name = "business"

  has_many :accounts, :foreign_key => :cust_id
end
