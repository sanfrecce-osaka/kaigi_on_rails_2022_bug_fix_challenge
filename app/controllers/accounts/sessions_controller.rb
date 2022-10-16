# frozen_string_literal: true

module Accounts
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      if account_signed_in? && !current_account.can_use_service?
        alert = message_of_can_not_sign_in
        sign_out :account
        redirect_to new_account_session_path, alert: alert and return
      end

      super
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def message_of_can_not_sign_in
      case current_account.corporation
      in ->(corporation) { corporation.approved? && !corporation.already_usage_started? }
        'サービス利用開始日前のためまだサービスを利用できません'
      in ->(corporation) { corporation.rejected? }
        '退会済のため、サービスを利用できません'
      end
    end
  end
end
