class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  USER_ROLE = %w[buyer seller admin]
end
