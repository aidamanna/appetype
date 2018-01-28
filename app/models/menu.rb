class Menu < ActiveRecord::Base
  STATE_DRAFT = 'draft'.freeze
  STATE_CLOSED = 'closed'.freeze
  STATE_PUBLISHED = 'published'.freeze

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

  def week_description
    initial_date = Date.strptime(week, '%YW%W')
    final_date = initial_date.next_day(4)

    "#{initial_date.strftime('%B %d')} to #{final_date.strftime('%B %d')}"
  end

  def draft?
    self.state == STATE_DRAFT
  end

  def published?
    self.state == STATE_PUBLISHED
  end

  def closed?
    self.state == STATE_CLOSED
  end

  def close
    self.state = STATE_CLOSED
  end
end
