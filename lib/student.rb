class Student
  attr_accessor :name, :grade 
  attr_reader :id
  
  def initialize(name, grade, id=nil)
    @id = id,
    @name = name,
    @grade = grade
  end 
 
  def self.create_table 
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY, 
      name TEXT, 
      grade INTEGER
      )
      SQL
    DB[:conn].execute(sql) 
  end
  
  def self.drop_table
    sql = "DROP TABLE students";
    DB[:conn].execute(sql)
  end 
 
# INSERT INTO Persons (FirstName) VALUES ('Joe');
# SELECT ID AS LastID FROM Persons WHERE ID = @@Identity 
  def save 
    sql = "INSERT INTO students (name, grade) VALUES (?,?)"; "SELECT ID AS LastID FROM students WHERE ID = @id";
    DB[:conn].execute(sql, self.name, self.grade)
  end 
  
  def self.create(name:, grade:)
    sql = "SELECT * FROM students" 
    DB[:conn].execute(sql)
    student = Student.new(name, grade)
    student.save
    student
  end


end
