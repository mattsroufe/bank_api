class Individual < ActiveRecord::Base
  self.table_name = "individual"

  has_many :accounts, :foreign_key => :cust_id

  def name
    [fname, lname].join(' ')
  end
end
