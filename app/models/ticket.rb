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
    begin
      polygon = RGeo::WKRep::WKTParser.new(factory, support_ewkt: true).parse(well_known_text)
      errors.add(:well_known_text, 'must be in the correct POLYGON format') unless polygon.valid?
    rescue RGeo::Error::ParseError
      errors.add(:well_known_text, 'must be in the correct POLYGON format')
    end
  end
end
