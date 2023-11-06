# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ActionController::API
      before_action :prepare_params, only: [:create]

      def create
        ticket = create_ticket
        create_excavator(ticket)
        render json: { success: true, message: 'Geospatial Data Imported successfully!' }
      rescue ActiveRecord::RecordInvalid, ArgumentError => e
        render json: { error: e.message }, status: :unprocessable_entity
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end

      private

      def prepare_params
        @ticket_params = TicketSchema.call(ticket_params).to_h
        @excavator_params = ExcavatorSchema.call(excavator_params).to_h
      rescue Dry::Struct::Error
        render json: { error: 'Invalid request structure or data types' }, status: :unprocessable_entity
      end

      def create_ticket
        ::Ticket.create!(transformed_ticket_params(@ticket_params))
      end

      def create_excavator(ticket)
        ticket.create_excavator!(transformed_excavator_params(@excavator_params))
      end

      def transformed_ticket_params(params)
        ticket_info = {
          response_due_date_time: params.dig(:date_times, :response_due_date_time),
          primary_service_area_code: params.dig(:service_area, :primary_service_area_code, :sa_code),
          additional_service_area_codes: params.dig(:service_area, :additional_service_area_codes, :sa_code),
          well_known_text: params.dig(:excavation_info, :digsite_info, :well_known_text)
        }

        params.except(:date_times, :service_area, :excavation_info).merge(ticket_info)
      end

      def transformed_excavator_params(params)
        address_info = {
          address: "#{params[:address]}, #{params[:city]}, #{params[:state]}, #{params[:zip]}"
        }
        params.slice(:company_name, :crew_onsite).merge(address_info)
      end

      def ticket_params
        params.deep_transform_keys(&:underscore).permit(
          :request_number,
          :sequence_number,
          :request_type,
          :request_action,
          date_times: [:response_due_date_time],
          service_area: {
            primary_service_area_code: [:sa_code],
            additional_service_area_codes: [sa_code: []]
          },
          excavation_info: { digsite_info: [:well_known_text] }
        )
      end

      def excavator_params
        params.deep_transform_keys(&:underscore).require(:excavator).permit(
          :company_name,
          :address,
          :city,
          :state,
          :zip,
          :crew_onsite
        )
      end
    end
  end
end
