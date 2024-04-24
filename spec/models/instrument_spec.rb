# == Schema Information
#
# Table name: instruments
#
#  id         :bigint           not null, primary key
#  instrument :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint
#  tutor_id   :bigint
#
# Indexes
#
#  index_instruments_on_student_id  (student_id)
#  index_instruments_on_tutor_id    (tutor_id)
#
require 'rails_helper'

RSpec.describe Instrument, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
