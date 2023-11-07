# frozen_string_literal: true

module MapboxHelper
  def mapbox_image_url(well_known_text)
    coordinates = format_coordinates(well_known_text)
    url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/geojson({\"type\":\"FeatureCollection\",\"features\":[{\"id\":\"4c97769717bde5d3ece6aa37ad153a26\",\"type\":\"Feature\",\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[#{coordinates}]}," \
      '"properties":{"title":""}}]})/auto/1200x1200?access_token=pk.eyJ1IjoiZWxpYW5icmFqYSIsImEiOiJjbG9va3B6eHMwMTJxMmlsOTNrdHFnaHl4In0.xcGyUJMs8EqpDiQbbW873g'
    image_tag(url)
  end

  def format_coordinates(well_known_text)
    well_known_text.scan(/-?\d+\.\d+\s-?\d+\.\d+/).map do |pair|
      pair.split.map(&:to_f)
    end
  end
end
