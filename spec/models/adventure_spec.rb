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

require 'spec_helper'

describe Adventure do
  pending "add some examples to (or delete) #{__FILE__}"
end
