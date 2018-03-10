class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    @employees = []

    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    if date >= @season_opening_date && date <= @season_closing_date
      true
    else
      false
    end
  end

  def add_animal(name)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = name
        return
      end
    end
  end

  def visit
    return_string = ""
    @employees.each do |employee|
      return_string += employee.greet + "\n"
    end
    @cages.each do |cage|
      unless cage.empty?
        return_string += cage.animal.speak + "\n"
      end
    end
    return return_string
  end
end
