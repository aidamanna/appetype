class Menu < ActiveRecord::Base
  validates :week, presence: true

  after_initialize :set_default_values

  def set_default_values
    self.state ||= 'draft'
    self.daily_menus ||= {
      monday: {
        side_dish: '',
        omni: '',
        veggie: ''
      },
      tuesday: {
        side_dish: '',
        omni: '',
        veggie: ''
      },
      wednesday: {
        side_dish: '',
        omni: '',
        veggie: ''
      },
      thursday: {
        side_dish: '',
        omni: '',
        veggie: ''
      },
      friday: {
        side_dish: '',
        omni: '',
        veggie: ''
      }
    }
  end
end
