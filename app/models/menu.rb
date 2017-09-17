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

  def week_description
    initial_date = Date.strptime(week, '%YW%W')
    final_date = initial_date.next_day(4)

    "#{initial_date.strftime('%B %d')} to #{final_date.strftime('%B %d')}"
  end

  def to_form_payload
    {
      title: week_description,
      settings: {
        is_public: self.state != 'closed',
        show_typeform_branding: false
      },
      fields: fields,
      thankyou_screens: [
        {
          title: 'Thank you for ordering your menu!',
          properties: {
            share_icons: false
          }
        }
      ],
      theme: {
        href: 'https://api.typeform.com/themes/MgPk3M'
      }
    }.to_json
  end

  private

  def fields
    daily_menus.map do |day, menu|
      {
        type: 'multiple_choice',
        title: day.capitalize,
        properties: {
          description: field_description(menu),
          vertical_alignment: true,
          choices: choices(day)
        }
      }
    end
  end

  def field_description(menu)
    "Side dish: #{menu['side_dish']}\n" \
    "Omni: #{menu['omni']}\n" \
    "Veggie: #{menu['veggie']}"
  end

  def choices(day)
    [
      {
        label: 'Home office - Omni',
        ref: "#{day}-home-omni"
      },
      {
        label: 'Home office - Veggie',
        ref: "#{day}-home-veggie"
      },
      {
        label: 'Beach house - Omni',
        ref: "#{day}-beach-omni"
      },
      {
        label: 'Beach house - Veggie',
        ref: "#{day}-beach-veggie"
      },
      {
        label: 'Out of the office',
        ref: "#{day}-out"
      }
    ]
  end
end
