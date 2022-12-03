class Url < ApplicationRecord
  belongs_to :user
  validates :original_url, presence: true
  validates :lookup_code, uniqueness: true, allow_blank: true

  def generate_lookup_code
    loop do
      # Generate a random string of 6 characters (a-z, A-Z, 0-9)
      lookup_code = SecureRandom.alphanumeric(6)
      break lookup_code unless Url.exists?(lookup_code:)
    end
  end
end
