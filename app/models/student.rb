# == Schema Information
#
# Table name: students
#
#  id                     :bigint           not null, primary key
#  avatarID               :string
#  coins                  :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  dayStreak              :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  experience             :string
#  forename               :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  studentID              :string
#  surname                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_students_on_email                 (email) UNIQUE
#  index_students_on_reset_password_token  (reset_password_token) UNIQUE
#
class Student < ApplicationRecord
  def full_name
    "#{forename} #{surname}"
  end
  
  has_many :instruments
  has_many :tutors, through: :instruments
  has_many :avatar_ownership


  has_many :student_sessions
  has_many :music_sessions, through: :student_sessions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
