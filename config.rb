###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
# redirect "index.html", to: "/about.html"

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def li_menu_link link_text, url
    klass = current_page.url == url ? 'active' : ''
    content_tag :li, class: klass do
      link_to link_text, url
    end
  end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

activate :rsync do |rsync|
  rsync.production_server = "www.enbrut.net"
  rsync.staging_server = "staging.enbrut.net"
  rsync.path = "/home/deploy/www/enbrut"
  rsync.user = "deploy"

  # Optional:
  # rsync.rsync_flags, "--compress --archive --delete -v"
end

# comanda: bundle exec middleman rsync production

# activate :deploy do |deploy|
#   deploy.method = :rsync
#   deploy.host   = 'www.enbrut.net'
#   deploy.path   = '/home/deploy/www/enbrut'
#   # Optional Settings
#   deploy.user  = 'deploy' # no default
#   # deploy.port  = 5309 # ssh port, default: 22
#   # deploy.clean = true # remove orphaned files on remote host, default: false
#   deploy.flags = '-vzr --no-o --no-p --del' # add custom flags, default: -avz
#   deploy.build_before = true
# end
