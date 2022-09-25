# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.custom_options = -> (event) do
    {
      account_id: event.payload[:account_id],
    }
  end
end
