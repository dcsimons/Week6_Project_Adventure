# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  text         :text
#  adventure_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Page < ActiveRecord::Base
	belongs_to :adventure
end
