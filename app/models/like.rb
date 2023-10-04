class Like < ApplicationRecord
    belongs_to :user
    belongs_to :comm, optional: true
    belongs_to :post, optional: true
    belongs_to :reply, optional: true
    

end
