# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include StudentsHelper
  include ProjectsHelper
  include EvaluationsHelper
end
