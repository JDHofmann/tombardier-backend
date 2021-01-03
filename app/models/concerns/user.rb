class User < ApplicationRecord
    has_one_attached :image
    has_many :projects
    has_many :user_links
    has_many :project_links, through: :projects
    has_many :project_images, through: :projects
    has_secure_password
end
