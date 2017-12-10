require_relative '../../app/models/menu_orders'

class MenuOrdersCounter
  def self.from_records(records)
    orders = MenuOrders.base(
      %w[monday tuesday wednesday thursday friday],
      %w[omni veggie out],
      %w[home beach]
    )

    records.each do |order|
      orders.add(order[0], order[1], order[2], order[3])
    end

    orders.to_hash
  end
end
