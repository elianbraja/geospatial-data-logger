# frozen_string_literal: true

class TicketSchema < Dry::Struct
  transform_keys(&:to_sym)

  attribute :request_number, Dry::Types['strict.string']
  attribute :sequence_number, Dry::Types['strict.string']
  attribute :request_type, Dry::Types['strict.string']
  attribute :request_action, Dry::Types['strict.string']
  attribute :date_times do
    attribute :response_due_date_time, Dry::Types['strict.string']
  end

  attribute :service_area do
    attribute :primary_service_area_code do
      attribute :sa_code, Dry::Types['strict.string']
    end
    attribute :additional_service_area_codes do
      attribute :sa_code, Dry::Types['array'].of(Dry::Types['strict.string'])
    end
  end

  attribute :excavation_info do
    attribute :digsite_info do
      attribute :well_known_text, Dry::Types['strict.string']
    end
  end
end
