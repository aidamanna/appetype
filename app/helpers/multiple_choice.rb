class MultipleChoice
  def from_daily_menu(day, menu)
    new(title: day.capitalize,
        description: field_description(menu))
  end

  def initialize; end

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
        ref: "#{day}-out-out"
      }
    ]
  end
end
