require_relative('../db/sql_runner')

class House

attr_reader :id, :name, :student_id, :url

  def initialize(options)
      @id = options['id'].to_i() if options['id']
      @name = options['name']
      @student_id = options['student_id']
      @url = options['url']
  end

  def save()
    sql= "
      INSERT INTO houses (
          name,
          student_id,
          url
      )

      VALUES ($1, $2, $3)
      RETURNING id;
    "

    values = [
      @name,
      @student_id,
      @url
    ]

    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new(house) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

end## class end
