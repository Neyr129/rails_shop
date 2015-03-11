class History < ActiveRecord::Base
	belongs_to :user
	has_many   :item_records
end
