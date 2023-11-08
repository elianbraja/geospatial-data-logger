# frozen_string_literal: true

class MapboxHelperTest < ActionView::TestCase
  test 'format_coordinates correctly parses valid well-known text coordinates' do
    well_known_text = 'POLYGON((-0.2 51.4786, -0.1577 51.4770, -0.1595 51.4755, -0.1580 51.4734, -0.1550 51.4749, -0.1527 51.4770,-0.1552 51.4786))'
    expected_result = [[-0.2, 51.4786], [-0.1577, 51.4770], [-0.1595, 51.4755], [-0.1580, 51.4734], [-0.1550, 51.4749], [-0.1527, 51.4770], [-0.1552, 51.4786]]
    assert_equal expected_result, format_coordinates(well_known_text)
  end
end
