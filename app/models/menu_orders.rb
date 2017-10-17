class MenuOrders
  attr_reader :days, :choices, :offices

  def self.base(days, choices, offices)
    raise 'Days cannot be empty' if days.empty?
    raise 'Choices cannot be empty' if choices.empty?
    raise 'Offices cannot be empty' if offices.empty?
    offices << 'total'

    new(days, choices, offices)
  end

  def to_hash
    offices_hash = Hash[@offices.map { |office| [office.to_sym, 0] }]
    choices_hash = Hash[@choices.map { |choice| [choice.to_sym, offices_hash] }]
    Hash[@days.map { |day| [day.to_sym, choices_hash] }]
  end

  private

  def initialize(days, choices, offices)
    @days = days
    @choices = choices
    @offices = offices
  end
end
