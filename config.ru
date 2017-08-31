require File.join(File.dirname(__FILE__), 'http/github_routes.rb')

$stdout.sync = true

run Http::GithubRoutes.new
