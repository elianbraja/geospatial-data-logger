# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.includes(:excavator).order(created_at: :desc)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
