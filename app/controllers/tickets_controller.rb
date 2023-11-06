# frozen_string_literal: true

class TicketsController < ActionController::Base
  layout 'application'
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
