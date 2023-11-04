# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id                            :bigint           not null, primary key
#  request_number                :string
#  sequence_number               :string
#  request_type                  :string
#  request_action                :string
#  response_due_date_time        :datetime
#  primary_service_area_code     :string
#  additional_service_area_codes :string           default([]), is an Array
#  well_known_text               :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
