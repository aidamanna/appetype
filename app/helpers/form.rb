class Form
  def self.from_menu(menu)
    new(title: menu.week_description,
        public: !menu.closed?,
        fields: menu.daily_menus.map { |day, daily_menu| MultipleChoice.from_daily_menu(day, daily_menu) })
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
      fields: fields.map(&:to_payload),
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
end
