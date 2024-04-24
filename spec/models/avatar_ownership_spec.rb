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
require 'rails_helper'

RSpec.describe AvatarOwnership, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
