# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  actor_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Character < ActiveRecord::Base

  validates :movie, :presence => true
  validates :actor, :presence => true
  belongs_to :movie
  belongs_to :actor
 end