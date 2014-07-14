Spree::Unifaun.config do |config|
  # Note all keys set here has to also exist in Preferences::Configuration

  # # Service 'Unifaun Online' or 'Pacsoft Online'
  config.service = 'Pacsoft Online'

  # # Login for service provider
  config.user_id = ''
  config.password = ''

  # # Quick ID for sender is obtained from the Unifaun or Packsoft service
  config.quick_id_for_sender = ''

  # # For example 1.10 = add 10% to calculated weight
  # # Note: "weight multiplyer" mispelled in unifaun api core, correct english is "weight multiplier"
  config.weight_multiplyer = 1.0

  # # These tracking pages resides on the Unifaun servers
  # # Currently English, Swedish, Danish and Finnish are supported
  config.track_and_trace_language = 'English'
end
