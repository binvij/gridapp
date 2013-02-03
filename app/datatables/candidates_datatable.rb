class CandidatesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Candidate.count,
      iTotalDisplayRecords: candidates.total_entries,
      aaData: data
    }
  end

private

  def data
    candidates.map do |candidate|
      [
        h(candidate.id),
        h(candidate.first_name),
        h(candidate.last_name),
        h(candidate.email),
        h(candidate.looking_for_change)
      ]
    end
  end

  def candidates
    @candidates ||= fetch_candidates
  end

  def fetch_candidates
    candidates = Candidate.order("#{sort_column} #{sort_direction}")
    candidates = candidates.page(page).per_page(per_page)
    if params[:sSearch].present?
      candidates = candidates.where("first_name like :search or last_name like :search", search: "%#{params[:sSearch]}%")
    end
    candidates
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[first_name email]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end