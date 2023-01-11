require './book'
require './person'
require './rental'
module Data
  def save_people
    File.open('person.json', 'w') do |file|
      people = @people.each_with_index.map do |person, index|
        {
          class: person.class, Name: person.name, ID: person.id, Age: person.age,
          parent_permission: person.parent_permission,
          specialization: (person.specialization if person.instance_of?(Teacher)),
          index: index
        }
      end
      file.write(JSON.generate(people))
    end
  end

  def save_books
    File.open('books.json', 'w') do |file|
      books = @books.each_with_index.map do |book, index|
        {
          title: book.title, author: book.author, index: index
        }
      end
      file.write(JSON.generate(books))
    end
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      rentals = @rentals.each_with_index.map do |rental, _index|
        {
          date: rental.date, book_index: @books.index(rental.book),
          person_index: @people.index(rental.person)
        }
      end

      file.write(JSON.generate(rentals))
    end
  end

  def preserve_all
    save_people
    save_books
    save_rentals
  end

  def read_people
    return [] unless File.exist?('person.json')

    file_handle = File.read('person.json')
    object_people = JSON.parse(file_handle)
    object_people.map do |person|
      case person['class']
      when 'Teacher'
        Teacher.new(person['specialization'], person['Age'], person['Name'])
      when 'Student'
        Student.new(person['Age'], person['Name'], parent_permission: person['parent_permission'])
      end
    end
  end

  def read_books
    return [] unless File.exist?('books.json')

    json_books = JSON.parse(File.read('books.json'))
    json_books.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def read_rentals
    return [] unless File.exist?('rentals.json')

    # file_handle = File.read('rentals.json')
    object_rentals = JSON.parse(File.read('rentals.json'))

    object_rentals.map do |rental|
      Rental.new(rental['date'], @books[rental['book_index']], @people[rental['person_index']])
    end
  end
end