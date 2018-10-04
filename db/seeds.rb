require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

student1= Student.new({
  "first_name" => "Harry",
  "second_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 15
  })

student2= Student.new({
  "first_name" => "Ron",
  "second_name" => "Weasley",
  "house" => "Gryffindor",
  "age" => 15
  })

student3= Student.new({
    "first_name" => "Herminone",
    "second_name" => "Granger",
    "house" => "Gryffindor",
    "age" => 15
})

student4= Student.new({
    "first_name" => "Ernie",
    "second_name" => "Mcmillan",
    "house" => "Hufflepuff",
    "age" => 15
})

student5= Student.new({
    "first_name" => "Anthony",
    "second_name" => "Goldstein",
    "house" => "Ravenclaw",
    "age" => 15
})

student6= Student.new({
    "first_name" => "Draco",
    "second_name" => "Malfoy",
    "house" => "Slytherin",
    "age" => 15
})

student1.save
student2.save
student3.save
student4.save
student5.save
student6.save

house1 = House.new({
  "name" => "Gryffindor",
  "student_id" => student1.id,
  "url" => "https://www.pottermore.com/collection/all-about-gryffindor"
  })

house2 = House.new({
  "name" => "Hufflepuff",
  "student_id" => student4.id,
  "url" => "https://www.pottermore.com/collection/all-about-hufflepuff"
  })

house3 = House.new({
  "name" => "Ravenclaw",
  "student_id" => student5.id,
  "url" => "https://www.pottermore.com/collection/all-about-ravenclaw"
  })

house4 = House.new({
  "name" => "Slytherin",
  "student_id" => student6.id,
  "url" => "https://www.pottermore.com/collection/all-about-slytherin"
  })

  house1.save()
  house2.save()
  house3.save()
  house4.save()
