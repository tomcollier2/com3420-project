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
FactoryBot.define do
  factory :student do
    studentID { "MyString" }
    forename { "MyString" }
    surname { "MyString" }
    username { "MyString" }
    passwordHash { "MyString" }
    experience { "MyString" }
    coins { 1 }
    dayStreak { 1 }
    avatarID { "MyString" }
  end
end
