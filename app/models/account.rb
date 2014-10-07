class Account < ActiveRecord::Base
  self.table_name = "account"

  def as_json(options = {})
    super(options.merge(:only => [:account_id, :product_cd]))
  end
end
