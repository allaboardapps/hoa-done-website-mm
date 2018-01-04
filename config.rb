# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :site_description, "A tool for small homeowners associations to get organized."
set :site_name, "HOA Done"
set :site_email, "hello@hoadone.com"
set :site_url, "https://www.hoadone.com"
set :cdn_url, "https://s3.amazonaws.com/hoadone-website-assets"
set :site_copyright, "© 2017-2018 HOA Done. All Rights Reserved."

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :asset_hash
activate :livereload
activate :gzip
activate :sprockets

if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

set(:port, 3000)

helpers do
  def cdn_file_url(file_name)
    "#{config[:cdn_url]}/#{file_name}"
  end

  def image_url(file_name)
    "#{config[:site_url]}/images/#{file_name}"
  end
end