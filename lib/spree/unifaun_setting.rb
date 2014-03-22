module Spree
  class UnifaunSetting < Preferences::Configuration
    # Service 'Unifaun Online' or 'Pacsoft Online'
    preference :service, :string, default: 'Pacsoft Online'

    # Login for service provider
    preference :user_id, :integer
    preference :password, :string, default: ''

    # Quick ID for sender is obtained from the Unifaun or Packsoft service
    preference :quick_id_for_sender, :integer

    # For example 1.10 = add 10% to calculated weight
    # Note: "weight multiplyer" mispelled in unifaun api core, correct english is "weight multiplier"
    preference :weight_multiplyer, :float, default: 1.0

    # These tracking pages resides on the Unifaun servers
    # Currently English, Swedish, Danish and Finnish are supported
    preference :track_and_trace_language, :string, default: 'English'

    def services
      ['Pacsoft Online', 'Unifaun Online']
    end

    def track_and_trace_languages
      %w(English Swedish Danish Finnish)
    end
  end
end
