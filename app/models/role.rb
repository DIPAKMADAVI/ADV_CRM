class Role < ApplicationRecord
     # belongs_to :user
      has_many :users, class_name: 'User', foreign_key: 'role_id'
     validates :role_name, presence: true, uniqueness: { case_sensitive: false}
end
