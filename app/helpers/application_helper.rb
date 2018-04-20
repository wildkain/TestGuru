module ApplicationHelper
  AUTHOR = 'Stanislav Karpinsky'.freeze
  def current_year
    Time.current.year
  end

  def github_url(author = AUTHOR, repo)
    link_to author, repo
  end
end
