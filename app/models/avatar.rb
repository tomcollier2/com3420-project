# == Schema Information
#
# Table name: avatars
#
#  id            :bigint           not null, primary key
#  cost          :integer
#  file_location :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Avatar < ApplicationRecord
    has_many :avatar_ownership
    
end
