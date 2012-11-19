class ApplicationController < ActionController::Base
  protect_from_forgery # used together with this tag <%= csrf_meta_tags %>
  include SessionsHelper
end
