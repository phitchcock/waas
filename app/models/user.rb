class User < ActiveRecord::Base
  has_many :wikis
end