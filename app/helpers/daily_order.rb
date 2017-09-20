class DailyOrder
  def self.from_ref(ref)
    ref_parts = ref.split('-')

    raise 'The ref does not have three parts' if ref_parts.length != 3

    new(ref_parts[0], ref_parts[1], ref_parts[2])
  end

  def to_hash
    {
      @day.to_sym => {
        office: @office,
        choice: @choice
      }
    }
  end

  private

  def initialize(day, office, choice)
    @day = day
    @office = office
    @choice = choice
  end
end
