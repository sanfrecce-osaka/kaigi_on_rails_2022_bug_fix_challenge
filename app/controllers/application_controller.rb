# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_sentry
  before_action :authenticate_account!, unless: -> { params[:controller].start_with?(/admin/) }

  def configure_sentry
    Sentry.set_user(id: current_account.id, email: current_account.email) if account_signed_in?
    Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
  end

  def after_sign_in_path_for(account)
    return super if account.kind_of? AdminUser

    flash.clear
    case account.corporation
    in ->(corporation) { corporation.free? }    then tasks_path
    in ->(corporation) { corporation.premium? } then projects_path
    end
  end
end
