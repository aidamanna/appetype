class MenuOrders
  def self.base(days, choices, offices)
    raise 'Days cannot be empty' if days.empty?
    raise 'Choices cannot be empty' if choices.empty?
    raise 'Offices cannot be empty' if offices.empty?
    offices << 'total'

    new(days, choices, offices)
  end

  def add(day, choice, office, quantity)
    return if choice == 'out'

    raise 'Invalid menu order' if @menu_orders.dig(day.to_sym, choice.to_sym, office.to_sym).nil?

    @menu_orders[day.to_sym][choice.to_sym][office.to_sym] = quantity
    @menu_orders[day.to_sym][choice.to_sym][:total] += quantity
  end

  def to_hash
    @menu_orders
  end

  private

  def initialize(days, choices, offices)
    offices_hash = Hash[offices.map { |office| [office.to_sym, 0] }]
    choices_hash = Hash[choices.map { |choice| [choice.to_sym, Marshal.load(Marshal.dump(offices_hash))] }]
    @menu_orders = Hash[days.map { |day| [day.to_sym, Marshal.load(Marshal.dump(choices_hash))] }]
  end
end
