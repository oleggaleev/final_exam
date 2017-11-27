class User < ApplicationRecord
  has_secure_password

  has_many :bids, dependent: :nullify
  has_many :auctions, dependent: :nullify


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  validates :first_name, :last_name, presence: true

  # before_create :generate_api_key

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def generate_api_key
    loop do
      self.api_key = SecureRandom.urlsafe_base64(64)
      break unless User.exists?(api_key: self.api_key)
    end
  end
end
