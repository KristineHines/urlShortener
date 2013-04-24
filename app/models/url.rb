class Url < ActiveRecord::Base
  def create_short_url
    self.update_attribute(:short_url, SecureRandom.hex(3))
  end
end
