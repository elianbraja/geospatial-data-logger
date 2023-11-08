# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id                            :bigint           not null, primary key
#  request_number                :string           not null
#  sequence_number               :string           not null
#  request_type                  :integer          not null
#  request_action                :string           not null
#  response_due_date_time        :datetime         not null
#  primary_service_area_code     :string           not null
#  additional_service_area_codes :string           default([]), not null, is an Array
#  well_known_text               :text             not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
