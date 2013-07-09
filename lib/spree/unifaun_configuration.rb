module Spree
  class UnifaunConfiguration < Preferences::Configuration
    # Service 'Unifaun Online' or 'Pacsoft Online'
    preference :service, :string, default: 'Pacsoft Online'

    # Login for service provider
    preference :user_id, :integer, default: 0
    preference :password, :string, default: ''

    # Quick ID for sender is obtained from the Unifaun or Packsoft service
    preference :quick_id_for_sender, :integer, default: 0

    # For example 1.10 = add 10% to calculated weight
    preference :weight_multiplyer, :integer, default: 1

    # These tracking pages resides on the Unifaun servers
    # Currently English, Swedish, Danish and Finnish are supported
    preference :track_and_trace_language, :string, default: 'English'
  end
end
