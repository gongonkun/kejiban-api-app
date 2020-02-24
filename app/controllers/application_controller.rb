class ApplicationController < ActionController::API
  def authenticate_user!
    return render :json, status: :un_authroized
  end
end
