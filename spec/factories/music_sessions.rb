# == Schema Information
#
# Table name: music_sessions
#
#  id          :bigint           not null, primary key
#  description :string
#  due_date    :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tutor_id    :bigint
#
# Indexes
#
#  index_music_sessions_on_tutor_id  (tutor_id)
#
FactoryBot.define do
  factory :music_session do
    
  end
end
