class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])

    doctor.patients.delete(patient)

    flash[:notice] = "#{patient.name} has been removed from Dr. #{doctor.name}'s caseload."
    
    redirect_to doctor_path(doctor)
  end
end