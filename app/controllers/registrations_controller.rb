class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, notice: 'Registrations are not open, but maybe sometime in the future'

  end

  def create
    redirect_to root_path, notice: 'Registrations are not open, but maybe sometime in the future'
  end
end
