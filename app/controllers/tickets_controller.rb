# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order(created_at: :desc).includes(:excavator)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
