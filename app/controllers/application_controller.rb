class ApplicationController < ActionController::Base
  include SessionsHelper
  include StudentsHelper
  include ProjectsHelper
end
