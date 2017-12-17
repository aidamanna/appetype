describe MenuPublisher do
  describe '#call' do
    it 'publishes a menu' do
      given_a_menu
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
  end

  def then_it_creates_a_form
    form = double
    @form_uid = 1
    allow(form).to receive(:form_uid).and_return(@form_uid)
    allow(CreateForm).to receive(:new).and_return(form)
  end

  def and_configures_a_webhook
    allow(CreateWebhook).to receive(:new)
  end

  def and_the_menu_is_set_to_published
    allow(@menu).to receive(:update).with(state: 'published', form: @form_uid)
  end

  def when_publishing_the_menu
    MenuPublisher.new.call(2)
  end
end
