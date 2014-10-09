class Account < ActiveRecord::Base
  self.table_name = "account"

  belongs_to :customer, :foreign_key => :cust_id
  belongs_to :product, :foreign_key => :product_cd
  has_many :transactions, :foreign_key => :txn_id

  def as_json(options={})
    super(
      :include => [
        :customer => {
          :methods => [
            :name
          ]
        }
      ]
    )
  end
end
