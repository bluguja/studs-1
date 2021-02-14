class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable



  has_many :providers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [ :google_oauth2, :twitter, :github, :linkedin]

  Roles = ["Teacher", "Student"]
  validates_presence_of :first_name, message: "cannot be empty"
  validates_presence_of :last_name, message: "cannot be empty"
  validates_presence_of :type, message: "cannot be empty"

  def full_name
    "#{first_name&.capitalize} #{last_name&.capitalize}"
  end

  def teacher?
    type == "Teacher"
  end

  def student?
    type == "Student"
  end

  def undefined?
    type == "UndefinedUser"
  end

  def self.create_from_provider_data(provider_data)
    email = provider_data.info.email
    first_name = provider_data.info.name.split(' ')[0]
    last_name = provider_data.info.name.split(' ')[1]
    password = "123456"
    self.create(email: email, password: password,first_name: first_name,last_name: last_name,type: "UndefinedUser")
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end
end

 
