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
class Ticket < ApplicationRecord
  include AllAttributesPresentable
  has_one :excavator, dependent: :destroy
  enum request_type: {
    Normal: 0,
    Urgent: 1
  }

  validate :valid_polygon_format

  def valid_polygon_format
    factory = RGeo::Geos.factory
    polygon = RGeo::WKRep::WKTParser.new(factory, support_ewkt: true).parse(well_known_text)
    errors.add(:well_known_text, 'must be in the correct POLYGON format') unless polygon.valid?
  end
end
