class Subsite < ActiveRecord::Base
  extend FriendlyId
	friendly_id :name, use: :slugged
  
  has_many :links, dependent: :destroy
end
