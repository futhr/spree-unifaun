feature 'Admin Settings for Unifaun', :js do

  stub_authorization!

  background do
    visit spree.admin_path
    click_link 'Configuration'
    click_link 'Unifaun Settings'
  end

  scenario 'update' do
    expect(page).to have_text_like 'Track and Trace Language'

    fill_in 'user_id', with: '12'
    fill_in 'password', with: '123'
    fill_in 'quick_id_for_sender', with: '1234'
    fill_in 'weight_multiplyer', with: '1.5'

    select2 'Pacsoft Online', from: 'Service'
    select2 'Swedish', from: 'Track and Trace Language'

    click_button 'Update'

    expect(page).to have_text 'successfully updated!'

    setting = Spree::UnifaunSetting.new

    expect(setting.preferred_user_id).to eq 12
    expect(setting.preferred_password).to eq '123'
    expect(setting.preferred_quick_id_for_sender).to eq 1234
    expect(setting.preferred_weight_multiplyer).to eq '1.5'
    expect(setting.preferred_service).to eq 'Pacsoft Online'
    expect(setting.preferred_track_and_trace_language).to eq 'Swedish'
  end
end
