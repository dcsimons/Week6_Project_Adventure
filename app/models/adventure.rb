# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  guid       :string(255)
#  library_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Adventure < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	belongs_to :library

	before_save {|adv| adv.guid = create_guid }

  private 

  def create_guid
    SecureRandom.urlsafe_base64(10)
  end
end
