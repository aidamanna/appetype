require_relative '../../app/models/orders_base'

class OrdersCounter
  def self.from_records(records)
    orders = OrdersBase.create(
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
