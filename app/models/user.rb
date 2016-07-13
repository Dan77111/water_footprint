class User < ActiveRecord::Base
  before_create :confirmation_token
  has_many :results

  has_secure_password

  validates :username, :presence => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
