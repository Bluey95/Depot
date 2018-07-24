class Service < ApplicationRecord

	validates :image, uniqueness: true, allow_blank: true, format: {
             with: %r{\.(gif|jpg|png)\Z}i,
message: 'must be a URL for GIF, JPG or PNG image.'
} 

	has_many :beauticians, :through => :bookings
  
  has_many :clients, :through => :bookings
  
  has_many :bookings, :inverse_of => :services
  accepts_nested_attributes_for :bookings
  
  # mount_uploader :image, ServiceUploader
end
