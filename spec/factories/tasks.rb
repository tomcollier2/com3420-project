# == Schema Information
#
# Table name: tasks
#
#  id               :bigint           not null, primary key
#  description      :string
#  practice_time    :integer
#  record_time      :integer
#  reward           :integer
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  music_session_id :bigint
#
# Indexes
#
#  index_tasks_on_music_session_id  (music_session_id)
#
FactoryBot.define do
  factory :task do
    
  end
end
