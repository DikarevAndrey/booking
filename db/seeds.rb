cities_list = [
  "Москва",
  "Рязань",
  "Санкт-Петербург",
  "Казань",
  "Нижний Новгород"
]

cities_list.each do |name|
  City.create(:name => name)
end

subways_list = [
  "Таганская",
  "Волжская",
  "Бауманская",
  "Китай-город",
  "Арбатская",
  "Павелецкая"
]

subways_list.each do |name|
  Subway.create(:name => name)
end

kinds_list = [
  "Бар",
  "Ресторан",
  "Пиццерия",
  "Кальянная",
  "Паб",
  "Кафе"
]

kinds_list.each do |name|
  Kind.create(:name => name)
end

cuisines_list = [
  "Итальянская",
  "Французская",
  "Русская",
  "Суши",
  "Пицца",
  "Вегетарианская"
]

cuisines_list.each do |name|
  Cuisine.create(:name => name)
end