class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :price
    validates :content
    validates :images
  end
  
  belongs_to :user

end
