cats = [
  {
    firstName: 'Felix',
    lastName: 'DeCat',
    age: 2,
    enjoys: 'Long naps on the couch, and a warm fire.'
  },
  {
    firstName: 'Homer',
    lastName: 'Simpson',
    age: 12,
    enjoys: 'Food mostly, really just food.'
  },
  {
    firstName: 'Jack',
    lastName: 'Smith',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.'
  }
]

cats.each do |attributes|
  Cat.create attributes
  puts "creating cat #{attributes}"
end