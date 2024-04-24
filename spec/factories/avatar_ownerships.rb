# == Schema Information
#
# Table name: avatar_ownerships
#
#  id           :bigint           not null, primary key
#  active       :boolean
#  avatar       :string
#  fileLocation :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :avatar_ownership do
    
  end
end
