class User < ActiveRecord::Base
  before_save { self.email.downcase! }
  
  before_validation(on: :create) do
    self.profile = Profile.create
  end

  def fullname
    self.fname + " " + self.lname;
  end

  has_many :posts, dependent: :nullify

  has_one :profile, dependent: :destroy

  validates :fname, presence: true
  validates :lname, presence: true
  validates :profile, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
	            	    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password 
	validates :password, length: { minimum: 8 }, allow_blank: true
end