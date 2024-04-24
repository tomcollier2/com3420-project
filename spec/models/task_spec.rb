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
require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
