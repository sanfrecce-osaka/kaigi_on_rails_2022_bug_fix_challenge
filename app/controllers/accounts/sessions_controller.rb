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
      if account_signed_in? && current_account.corporation.rejected?
        sign_out :account
        redirect_to new_account_session_path, alert: '退会済のため、サービスを利用できません' and return
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
  end
end
