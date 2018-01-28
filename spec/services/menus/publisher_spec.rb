describe Menus::Publisher do
  describe '#call' do
    it 'publishes a menu' do
      given_a_draft_menu
      then_it_creates_a_form
      and_configures_a_webhook
      and_it_sets_the_menu_to_published
      when_publishing_the_menu
    end
  end

  private

  def given_a_draft_menu
    @menu = double(:menu)
    @form = double(:form)
    allow(Menu).to receive(:find).and_return(@menu)
    allow(@menu).to receive(:draft?).and_return(true)
    allow(Form).to receive(:from_menu).and_return(@form)
    allow(@form).to receive(:to_payload)
  end

  def then_it_creates_a_form
    @form_client = double(:form_client)
    expect(@form_client).to receive(:create)
  end

  def and_configures_a_webhook
    @webhook_client = double(:webhook_client)
    expect(@webhook_client).to receive(:create)
  end

  def and_it_sets_the_menu_to_published
    expect(@menu).to receive(:update).with(hash_including(state: 'published'))
  end

  def when_publishing_the_menu
    Menus::Publisher.new(@form_client, @webhook_client).call(1)
  end
end
