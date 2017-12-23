class MultipleChoice
  def self.from_daily_menu(day, menu)
    new(title: day.capitalize,
        description: field_description(menu),
        choices: choices(day))
  end

  def to_payload
    {
      type: 'multiple_choice',
      title: title,
      properties: {
        description: description,
        vertical_alignment: true,
        choices: choices
      }
    }
  end

  private

  attr_reader :title, :description, :choices

  def initialize(title:, description:, choices:)
    @title = title
    @description = description
    @choices = choices
  end

  private_class_method def self.field_description(menu)
    "Side dish: #{menu['side_dish']}\n" \
    "Omni: #{menu['omni']}\n" \
    "Veggie: #{menu['veggie']}"
  end

  private_class_method def self.choices(day)
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
