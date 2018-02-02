module Choices
  def self.generate(day)
    [
      Choice.new(label: 'Home office - Omni', ref: "#{day}-home-omni"),
      Choice.new(label: 'Home office - Veggie', ref: "#{day}-home-veggie"),
      Choice.new(label: 'Beach house - Omni', ref: "#{day}-beach-omni"),
      Choice.new(label: 'Beach house - Veggie', ref: "#{day}-beach-veggie"),
      Choice.new(label: 'Out of the office', ref: "#{day}-out-out")

    ]
  end
end
