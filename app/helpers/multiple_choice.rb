class MultipleChoice
  def self.from_daily_menu(day, daily_menu)
    new(title: day.capitalize,
        description: field_description(daily_menu),
        choices: Choices.generate(day))
  end

  def field_description(daily_menu)
    "Side dish: #{daily_menu['side_dish']}\n" \
    "Omni: #{daily_menu['omni']}\n" \
    "Veggie: #{daily_menu['veggie']}"
  end

  def to_payload
    {
      type: 'multiple_choice',
      title: title,
      properties: {
        description: description,
        vertical_alignment: true,
        choices: choices.to_payload
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
end
