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
    @menu = double(:menu)
    allow(Menu).to receive(:find).and_return(@menu)
    allow(@menu).to receive(:to_payload)
  end

  def and_a_user
    oauth_token = double(:oauth_token)
    allow(OauthTokenRetriever).to receive(:new).and_return(oauth_token)
    allow(oauth_token).to receive(:call)
  end

  def then_it_creates_a_form
    form = double(:form)
    allow(Form).to receive(:from_menu).and_return(form)
    allow(form).to receive(:to_payload)

    form_client = double(:form_client)
    allow(FormClient).to receive(:new).and_return(form_client)
    expect(form_client).to receive(:create)
  end

  def and_configures_a_webhook
    webhook_client = double(:webhook_client)
    allow(WebhookClient).to receive(:new).and_return(webhook_client)
    expect(webhook_client).to receive(:create)
  end

  def and_the_menu_is_set_to_published
    expect(@menu).to receive(:update).with(hash_including(state: 'published'))
  end

  def when_publishing_the_menu
    MenuPublisher.new.call(1, 2)
  end
end
