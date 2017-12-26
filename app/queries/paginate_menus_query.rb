class PaginateMenusQuery
  def call(page)
    Menu.paginate(page: page, per_page: 5).order('id DESC')
  end
end
