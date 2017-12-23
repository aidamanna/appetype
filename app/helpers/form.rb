class Form
  def self.from_menu(menu)
    new(title: week_description(menu.week),
        public: menu.state != 'closed',
        fields: menu.daily_menus.map { |day, daily_menu| MultipleChoice.from_daily_menu(day, daily_menu).to_payload })
  end

  def to_payload
    {
      title: title,
      settings: {
        is_public: public,
        show_typeform_branding: false
      },
      hidden: [
        'email'
      ],
      fields: fields,
      thankyou_screens: [
        {
          title: 'Thank you for ordering your menu!',
          properties: {
            share_icons: false
          }
        }
      ],
      theme: {
        href: 'https://api.typeform.com/themes/MgPk3M'
      }
    }.to_json
  end

  private

  attr_reader :title, :public, :fields

  def initialize(title:, public:, fields:)
    @title = title
    @public = public
    @fields = fields
  end

  private_class_method def self.week_description(week)
    initial_date = Date.strptime(week, '%YW%W')
    final_date = initial_date.next_day(4)

    "#{initial_date.strftime('%B %d')} to #{final_date.strftime('%B %d')}"
  end
end
