class User < ActiveRecord::Base
  has_many :results
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :name, :presence => true, :length => { :in => 3..20 }
end
