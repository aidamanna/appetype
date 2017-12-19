describe MenuPublisher do
  describe '#call' do
    it 'publishes a menu' do
      given_a_menu
      and_a_user
      then_it_creates_a_form
      and_configures_a_webhook
      and_the_menu_is_set_to_published
      when_publishing_the_menu
    end
  end

  private

  def given_a_menu
    @menu = double
    allow(Menu).to receive(:find).and_return(@menu)
    allow(@menu).to receive(:to_form_payload)
  end

  def and_a_user
    oauth_token = double
    allow(OauthTokenRetriever).to receive(:new).and_return(oauth_token)
    allow(oauth_token).to receive(:call)
  end

  def then_it_creates_a_form
    form = double
    @form_uid = 1
    allow(form).to receive(:form_uid).and_return(@form_uid)
    form_client = double
    allow(FormClient).to receive(:new).and_return(form_client)
    allow(form_client).to receive(:create).and_return(@form_uid)
  end

  def and_configures_a_webhook
    webhook_client = double
    allow(WebhookClient).to receive(:new).and_return(webhook_client)
    allow(webhook_client).to receive(:create)
  end

  def and_the_menu_is_set_to_published
    allow(@menu).to receive(:update).with(state: 'published', form: @form_uid)
  end

  def when_publishing_the_menu
    MenuPublisher.new.call(1, 2)
  end
end
