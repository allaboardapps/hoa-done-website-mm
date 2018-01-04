xml.instruct!
xml.urlset(
  "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9",
  "xmlns:image" => "http://www.google.com/schemas/sitemap-image/1.1",
  "xmlns:video" => "http://www.google.com/schemas/sitemap-video/1.1"
) do
  xml.url do
    xml.loc config[:site_url]
    xml.lastmod Date.current.strftime("%Y-%m-%d")
    xml.changefreq "weekly"
    xml.priority 1.0
  end
end
