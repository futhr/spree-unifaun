if Rails.env.development? || Rails.env.test?
  StateMachine::Machine.ignore_method_conflicts = true
  I18n.enforce_available_locales = true
  Devise.secret_key = "6a340b49114b328f2a2bd77d4527ff428ca58611451800df2d162c7b2a530772c9494182b2ad7ead772923663cb86d06eb30"
end