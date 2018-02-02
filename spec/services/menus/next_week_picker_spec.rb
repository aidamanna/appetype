describe Menus::NextWeekPicker do
  describe '#call' do
    it 'returns next week when no previous menu is defined' do
      given_there_are_no_previous_menus
      then_next_week_is_returned
      when_calling_next_week_picker
    end

    it 'returns next week when previous menus are defined' do
      given_there_are_previous_menus
      then_the_week_after_last_menus_week_is_returned
      when_calling_next_week_picker
    end

    private

    def given_there_are_no_previous_menus
      allow(Menu).to receive(:last).and_return(nil)
    end

    def given_there_are_previous_menus
      @menu = double(:menu)
      allow(Menu).to receive(:last).and_return(@menu)
    end

    def then_next_week_is_returned
      date = double(:date)
      expect(Date).to receive(:today).and_return(date)
      expect(date).to receive(:next_day).and_return(date)
      expect(date).to receive(:strftime)
    end

    def then_the_week_after_last_menus_week_is_returned
      date = double(:date)
      allow(@menu).to receive(:[])
      expect(Date).to receive(:strptime).and_return(date)
      expect(date).to receive(:next_day).and_return(date)
      expect(date).to receive(:strftime)
    end

    def when_calling_next_week_picker
      Menus::NextWeekPicker.new.call
    end
  end
end