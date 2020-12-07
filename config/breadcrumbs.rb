crumb :root do
  link "Home", root_path
end

# user
crumb :registration do
  link "ユーザー情報新規作成", new_user_registration_path
  parent :root
end

crumb :session do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :users_show do
  link "マイページ", user_path
  parent :root
end

# rooms
crumb :rooms do
  link "募集一覧", rooms_path
  parent :root
end

crumb :rooms_new do
  link "新規募集", new_room_path
  parent :rooms
end

crumb :rooms_show do
  link "募集詳細", room_path
  parent :rooms
end

crumb :rooms_edit do
  link "募集情報修正", edit_room_path
  parent :rooms
end

crumb :rooms_search do
  link "検索結果", search_rooms_path
  parent :rooms
end

crumb :contacts do
  link "コンタクト", contacts_index_path
  parent :rooms
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).