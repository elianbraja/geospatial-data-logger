# frozen_string_literal: true

class TicketsController < ActionController::Base
  layout 'application'
  def index
    @tickets = Ticket.order(created_at: :desc)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
