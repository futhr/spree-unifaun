RSpec.describe Spree::Admin::UnifaunSettingsController, type: :controller do
  stub_authorization!

  before do
    reset_spree_preferences
    user = create(:admin_user)
    allow(controller).to receive(:try_spree_current_user).and_return(user)
  end

  context '#update' do
    it 'redirects to unifaun settings page' do
      spree_put :update, preferences: { preview_size: 4 }
      expect(response).to redirect_to spree.edit_admin_unifaun_settings_path
    end

    context 'For parameters:
            service: Unifaun
            user_id: 123,
            password: 123,
            quick_id_for_sender: 1,
            weight_multiplyer: 1.5,
            track_locale: true
            track_and_trace_language: Swedish' do

      subject { Spree::Unifaun::Config }

      it 'sets preferred_service to "Unifaun"' do
        spree_put :update, preferences: { service: 'Unifaun' }
        expect(subject.preferred_service).to eq('Unifaun')
      end

      it 'sets preferred_user_id to 123' do
        spree_put :update, preferences: { user_id: 123 }
        expect(subject.preferred_user_id).to be(123)
      end

      it 'sets preferred_password to 123' do
        spree_put :update, preferences: { password: 123 }
        expect(subject.preferred_password).to be(123)
      end

      it 'sets preferred_quick_id_for_sender to 1' do
        spree_put :update, preferences: { quick_id_for_sender: 1 }
        expect(subject.preferred_quick_id_for_sender).to be(1)
      end

      it 'sets preferred_weight_multiplyer to 1.5' do
        spree_put :update, preferences: { weight_multiplyer: 1.5 }
        expect(subject.preferred_weight_multiplyer).to be(1.5)
      end

      it 'sets preferred_track_and_trace_language to "Swedish"' do
        spree_put :update, preferences: { track_and_trace_language: 'Swedish' }
        expect(subject.preferred_track_and_trace_language).to eq('Swedish')
      end
    end
  end

  context '#edit' do
    it 'renders the edit template' do
      spree_get :edit
      expect(response).to render_template(:edit)
    end
  end
end
