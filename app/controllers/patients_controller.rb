class PatientsController < ApplicationController
  def index
    @patients = Patient.over_18.alphabetical_order
  end
end