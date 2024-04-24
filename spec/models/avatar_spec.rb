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
require 'rails_helper'

RSpec.describe Avatar, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
