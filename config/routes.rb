Rails.application.routes.draw do
  get 'patient_info/index'
  root 'patient_info#index'
end
