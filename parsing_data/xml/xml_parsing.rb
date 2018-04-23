require 'nokogiri'

class GuiseppeMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_names
    @menu.search('name')
  end

  def xpath_get_names
    # @menu.xpath('/breakfast_menu/food/name')
    @menu.xpath('//name')
  end

  def get_all_food_items
    @menu.search('food')
  end

  def get_the_nth_food_item_by_index(number)
    get_all_food_items[number]
  end

  def get_nth_child_of_food_item(food_index, child_index)
    get_the_nth_food_item_by_index(food_index).element_children[child_index]
  end

  def get_all_prices_as_floats

    prices = []
    @menu.xpath('//price').each do |price|
      prices << price.text.gsub('£', '').to_f
    end
    prices
  end

  def xpath_get_calories
    @menu.xpath('//calories')
  end

  def xpath_get_names
    @menu.xpath('//name')
  end

end

x = GuiseppeMenu.new

# puts x.get_menu_names[2].text
# puts x.xpath_get_names
# # puts x.get_all_food_items
# puts x.get_the_nth_food_item_by_index(1)
# puts x.get_nth_child_of_food_item(1, 2)
# puts x.get_all_prices_as_floats
# puts x.get_all_prices_as_floats
puts x.xpath_get_calories
# puts x.xpath_get_names
