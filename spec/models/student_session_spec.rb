# == Schema Information
#
# Table name: student_sessions
#
#  id               :bigint           not null, primary key
#  completed        :boolean
#  notes            :string
#  rating           :integer
#  time_completed   :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  music_session_id :bigint
#  student_id       :bigint
#
# Indexes
#
#  index_student_sessions_on_music_session_id  (music_session_id)
#  index_student_sessions_on_student_id        (student_id)
#
require 'rails_helper'

RSpec.describe StudentSession, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
