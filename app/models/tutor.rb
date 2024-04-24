# == Schema Information
#
# Table name: tutors
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  forename               :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  surname                :string
#  tutorID                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_tutors_on_email                 (email) UNIQUE
#  index_tutors_on_reset_password_token  (reset_password_token) UNIQUE
#
class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :instruments
  has_many :students, through: :instruments
  has_many :music_sessions
  has_many :tasks, through: :music_sessions
  has_many :avatar_ownership

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
