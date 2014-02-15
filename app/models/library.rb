# == Schema Information
#
# Table name: libraries
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Library < ActiveRecord::Base
	has_many :adventures, dependent: :destroy
end
