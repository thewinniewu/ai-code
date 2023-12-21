require 'csv'

# Input data
input_data = <<~INPUT

Americano × 8	$28.00
Regular × 8	$28.00
BOX/BAG × 29	$14.50
Regular × 29	$14.50
Bread × 58	$556.00
Country Loaf × 9	$81.00
Jalapeño Cheddar × 11	$110.00
Large Cinnamon Swirl × 12	$120.00
Sandwich Loaf (Sourdough) × 15	$135.00
Super Seeded × 11	$110.00
Brownies/Crispies × 27	$121.50
Black Sesame Rice Crispie × 11	$49.50
Cocoa Nib Brownie × 9	$40.50
Milk Tea Blondie × 7	$31.50
Buns/Danish × 34	$221.00
Amelie × 15	$97.50
Strawberry Matcha Croissant Bun × 19	$123.50
Cakes × 12	$96.00
Choco Oolong Mini × 12	$96.00
Cappuccino × 7	$32.50
Regular × 7	$32.50
Cold Brew × 7	$28.00
Regular × 7	$28.00
Cookies × 77	$269.50
Brown Butter Choco Chip × 35	$122.50
Peppermint Cocoa × 16	$56.00
Red Velvet × 12	$42.00
Ube Snickerdoodle × 14	$49.00
Drip × 13	$42.25
Regular × 13	$42.25
Espresso × 1	$3.50
Regular × 1	$3.50
Flat White × 4	$18.50
Regular × 4	$18.50
Hot Tea × 2	$7.00
Dragon Green × 2	$7.00
Latte × 11	$55.75
Regular × 11	$55.75
Mochi × 35	$155.00
3 Set × 5	$50.00
Pandan Coconut × 8	$28.00
Raspberry × 15	$52.50
Thai Tea × 7	$24.50
Muffins/Financier × 23	$104.25
Cocoa Almond Financier × 8	$38.00
Honey × 4	$14.00
Lemon Blueberry × 11	$52.25
Pandan Aerocano × 5	$32.50
Regular × 5	$32.50
Passionfruit Espresso Tonic × 5	$32.50
Regular × 5	$32.50
Retail × 7	$61.00
Furikake Chex Mix × 5	$45.00
Gochujang Caramel Popcorn × 1	$8.00
Pandan Caramel Popcorn × 1	$8.00
Retail Beans × 1	$17.50
El Corazon × 1	$17.50
Savory × 191	$1,162.60
Char Siu × 23	$155.25
Curry Potato × 12	$81.00
Everything × 29	$172.55
Ham Cheese × 28	$166.60
Kimchi Corn Cheese × 23	$132.25
Mushroom × 29	$174.00
Sausage Pepper × 21	$124.95
Savory Pull Apart × 26	$156.00
Small Pie × 12	$108.00
Pumpkin Pandan × 12	$108.00
Specials × 78	$443.00
Apple Oat Crumble Danish × 26	$156.00
Mini Pumpkin Pie × 1	$9.00
Pastelito Strawberry Guava × 14	$56.00
Ube Twice Bake × 30	$180.00
Vietnamese Coffee Tart × 7	$42.00
Thai Tea Cloud × 3	$19.50
Regular × 3	$19.50
Traditionals × 202	$1,127.40
Bostock × 28	$161.00
Butter × 25	$106.25
Chocolate × 14	$69.30
Ginger Pull Apart × 62	$356.50
Hazelnut Choco × 27	$160.65
Pistachio Berry × 46	$273.70

INPUT

# Function to process the input and generate the CSV output
def process_sales_data(input_data)
  # Initialize a hash to store volume data
  sales_data = Hash.new(0)

  # Process each line in the input data
  input_data.each_line do |line|
    if line.strip.empty?
      next
    end

    # Split the line into item and volume
    item, volume = line.split("\t")[0].strip.split(' × ')

    # Add volume data to the appropriate column
    if item.strip == "Espresso"
      sales_data['Espresso'] += volume.to_i
    elsif item.strip == "Americano"
      sales_data['Americano'] += volume.to_i
    elsif item.strip == "Drip"
      sales_data['Drip'] += volume.to_i
    elsif item.strip == "Cold Brew"
      sales_data['Cold Brew'] += volume.to_i
    elsif item.strip == "Macchiato"
      sales_data['Macchiato'] += volume.to_i
    elsif item.strip == "Cortado"
      sales_data['Cortado'] += volume.to_i
    elsif item.strip == "Flat White"
      sales_data['Flat White'] += volume.to_i
    elsif item.strip == "Cappuccino"
      sales_data['Cappuccino'] += volume.to_i
    elsif item.strip == "Latte"
      sales_data['Latte'] += volume.to_i
    elsif item.strip == "Pandan Aerocano"
      sales_data['Pandan Aerocano'] += volume.to_i
    elsif item.strip == "Passionfruit Espresso Tonic"
      sales_data['Passion ET'] += volume.to_i
    elsif item.strip == "Thai Tea Cloud"
      sales_data['Thai Tea Cloud'] += volume.to_i
    elsif item.strip == "Ice Tea" || item.strip == "Hot Tea"
      sales_data['Tea'] += volume.to_i
    elsif item.strip == "Retail Beans"
      sales_data['Retail Beans'] += volume.to_i
    end
  end

  sales_data
end

# Generate CSV output
sales_data = process_sales_data(input_data)

# Order the columns as specified
columns_order = [
  'Espresso', 'Americano', 'Drip', 'Cold Brew', 'Macchiato', 'Cortado',
  'Flat White', 'Cappuccino', 'Latte', 'Pandan Aerocano', 'Passion ET',
  'Special Filter', 'Thai Tea Cloud', 'Tea', 'Retail Beans'
]

# Create a CSV string
csv_output = CSV.generate_line(columns_order.map { |column| sales_data[column] })

# Print the CSV output
puts csv_output
