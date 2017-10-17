class MenuOrdersCounter
  def self.from_records(records)
    return {} if records.empty?

    MenuOrders.base(
      %w(monday tuesday wednesday thursday friday),
      %w(omni veggie),
      %w(home_office beach_house)
    ).to_hash
  end
end
