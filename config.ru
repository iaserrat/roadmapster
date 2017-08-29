require File.join(File.dirname(__FILE__), 'http/github_routes.rb')

run Http::GithubRoutes.new
