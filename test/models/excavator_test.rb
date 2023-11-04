# frozen_string_literal: true

# == Schema Information
#
# Table name: excavators
#
#  id           :bigint           not null, primary key
#  company_name :string
#  address      :text
#  crew_on_site :boolean
#  ticket_id    :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class ExcavatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
