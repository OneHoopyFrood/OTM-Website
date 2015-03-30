class User < ActiveRecord::Base
  def fullname
    self.fname << " " << self.lname;
  end

  has_many :posts, dependent: :nullify

  before_save { email.downcase! }

  validates :fname, presence: true
  validates :lname, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
	            	    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password 
	validates :password, length: { minimum: 8 }, allow_blank: true
end