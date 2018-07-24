# Tenant Of
  belongs_to :account, :inverse_of => :trainers
  accepts_nested_attributes_for :account
  
  belongs_to :user, :inverse_of => :trainers
  accepts_nested_attributes_for :user
  
  has_many :bookings, dependent: :destroy, :inverse_of => :beautician
  accepts_nested_attributes_for :bookings
  
  has_many :services, :through => :bookings
  
  has_many :service_payments, :through => :bookings
  
  has_many :schedules, dependent: :destroy, :inverse_of => :beautician
  accepts_nested_attributes_for :schedules
  
  mount_uploader :photo, BeauticianUploader
  
  def name 
    "#{first_name} #{last_name}"
  end
  
  def email
    User.find_by_id(self.user_id)
  end