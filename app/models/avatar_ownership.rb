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
class AvatarOwnership < ApplicationRecord
    belongs_to :avatar
    belongs_to :students
    belongs_to :tutors

end
