class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable permite crear admins, por ahora lo hacemos por seeder
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
