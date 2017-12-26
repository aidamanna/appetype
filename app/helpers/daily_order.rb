class DailyOrder
  def self.from_ref(ref)
    ref_parts = ref.split('-')

    raise "The ref does not have three parts: #{ref}" if ref_parts.length != 3

    new(ref_parts[0], ref_parts[1], ref_parts[2])
  end

  def to_hash
    {
      day.to_sym => {
        office: office,
        choice: choice
      }
    }
  end

  private

  attr_reader :day, :office, :choice

  def initialize(day, office, choice)
    @day = day
    @office = office
    @choice = choice
  end
end
