class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])

    doctor.patients.delete(patient)

    redirect_to doctor_path(doctor), notice: "#{patient.name} has been removed from Dr. #{doctor.name}'s caseload."
  end
end