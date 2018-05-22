# frozen_string_literal: true

module ApplicationHelper
  AUTHOR = 'Stanislav Karpinsky'
  def current_year
    Time.current.year
  end

  def github_url(author = AUTHOR, repo)
    link_to author, repo
  end

  def alert_body
    content_tag :p, flash[:alert], class: 'flash alert'
  end

  def flash_messages
    html = ''
    flash.each { |key, value| html << content_tag(:p, value, class: "flash #{key}") }
    html.html_safe
  end
end
