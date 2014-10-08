class Account < ActiveRecord::Base
  self.table_name = "account"

  belongs_to :customer, :foreign_key => :cust_id

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
