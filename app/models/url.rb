class Url < ApplicationRecord
  belongs_to :user
  validates :original_url, presence: true
  validates :lookup_code, uniqueness: true, allow_blank: true

  def generate_lookup_code
    loop do
      # generate a random code using SecureRandom.urlsafe_base64 which returns a random string of 6 characters
      lookup_code = SecureRandom.urlsafe_base64(6)
      break lookup_code unless Url.exists?(lookup_code: lookup_code)
    end
  end
  
end
