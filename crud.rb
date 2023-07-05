require 'json'

# Function to load data from a JSON file
def load_data(file_name)
  JSON.parse(File.read(file_name))
rescue
  []
end

# Function to save data to a JSON file
def save_data(file_name, data)
  File.write(file_name, JSON.pretty_generate(data))
end

# Function to create a new record
def create_record(file_name, record)
  data = load_data(file_name)
  data << record
  save_data(file_name, data)
end

# Function to read all records
def read_records(file_name)
  load_data(file_name)
end

# Function to update a record
def update_record(file_name, index, updated_record)
  data = load_data(file_name)
  return unless data[index]

  data[index] = updated_record
  save_data(file_name, data)
end

# Function to delete a record
def delete_record(file_name, index)
  data = load_data(file_name)
  return unless data[index]

  data.delete_at(index)
  save_data(file_name, data)
end

# Example usage
file_name = 'records.json'

# Create a new record
record1 = { id: 1, name: 'John Doe', age: 30 }
create_record(file_name, record1)

# Read all records
all_records = read_records(file_name)
puts "All Records:"
all_records.each { |record| puts record }

# Update a record
updated_record = { id: 1, name: 'John Smith', age: 35 }
update_record(file_name, 0, updated_record)

# Read all records after update
all_records = read_records(file_name)
puts "All Records after Update:"
all_records.each { |record| puts record }

# Delete a record
delete_record(file_name, 0)

# Read all records after delete
all_records = read_records(file_name)
puts "All Records after Delete:"
all_records.each { |record| puts record }
