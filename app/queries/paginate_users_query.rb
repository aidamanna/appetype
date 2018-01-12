class PaginateUsersQuery
  def call(page)
    User.paginate(page: page, per_page: 4).order(:name)
  end
end
