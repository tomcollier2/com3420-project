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
class Instrument < ApplicationRecord
    belongs_to :tutor
    belongs_to :student
end
