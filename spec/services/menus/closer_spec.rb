describe Menus::Closer do
  describe '#call' do
    it 'closes a menu' do
      given_a_menu
      and_a_user
      then_it_makes_the_form_private
      and_it_sets_the_menu_to_closed
      when_closing_the_menu
    end

    private

    def given_a_menu
      @menu = double(:menu)
      allow(Menu).to receive(:find).and_return(@menu)
      allow(@menu).to receive(:form)
      allow(@menu).to receive(:to_form_payload)
    end

    def and_a_user
      allow(Oauth::TokenRetriever).to receive(:call)
    end

    def then_it_makes_the_form_private
      form_client = double(:form_client)
      allow(FormClient).to receive(:new).and_return(form_client)
      expect(form_client).to receive(:update)
    end

    def and_it_sets_the_menu_to_closed
      expect(@menu).to receive(:state=).with('closed')
      expect(@menu).to receive(:save)
    end

    def when_closing_the_menu
      Menus::Closer.new.call(1, 2)
    end
  end
end
