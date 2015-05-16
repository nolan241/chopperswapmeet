class Category < ActiveRecord::Base
  has_many :pins, dependent: :nullify
end