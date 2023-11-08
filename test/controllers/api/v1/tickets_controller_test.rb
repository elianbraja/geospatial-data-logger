# frozen_string_literal: true

require_relative '../../../fixtures/api_request_params'
module Api
  module V1
    class TicketsControllerTest < ActionDispatch::IntegrationTest
      def setup
        @valid_params = ::ApiRequestParams::VALID_PARAMS
        @invalid_params = ::ApiRequestParams::INVALID_PARAMS
      end

      test 'should create ticket with valid params' do
        ticket_count = Ticket.count
        excavator_count = Excavator.count

        post api_v1_tickets_path,
             params: @valid_params
        assert_response :success

        assert_equal ticket_count + 1, Ticket.count
        assert_equal excavator_count + 1, Excavator.count
      end

      test 'should return unprocessable with invalid params' do
        post api_v1_tickets_path, params: @invalid_params
        assert_response :unprocessable_entity
      end
    end
  end
end
