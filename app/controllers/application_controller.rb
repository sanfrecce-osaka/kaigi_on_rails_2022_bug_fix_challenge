# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Banken

  before_action :configure_sentry
  before_action :authenticate_account!, unless: -> { params[:controller].start_with?(/admin/) }

  def banken_user
    current_account
  end

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

  def append_info_to_payload(payload)
    super
    payload[:account_id] = current_account&.id
  end
end
