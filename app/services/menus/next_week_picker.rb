module Menus
  class NextWeekPicker
    def call
      last_menu = Menu.last
      date = last_menu.nil? ? Date.today : Date.strptime(last_menu[:week], '%YW%W')
      date.next_day(7).strftime('%YW%W')
    end
  end
end
