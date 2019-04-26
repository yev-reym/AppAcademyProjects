require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      result = DBConnection.execute2(<<-SQL)
      SELECT 
      * 
      FROM 
      #{self.table_name}
      SQL
      @columns = result.first.map { |column| column.to_sym  }
    else
      @columns
    end
  end

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}=") do |value|
       self.attributes[column] = value
      end

       define_method(column) do 
        self.attributes[column]
      end

    end

  end

  def self.table_name=(table_name)
    instance_variable_set("@table_name",table_name)
  end

  def self.table_name
    class_name = self.to_s
    @table_name = "#{class_name.downcase}s"
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT 
      * 
      FROM 
      #{self.table_name}
      SQL
      self.parse_all(results)
  end

  def self.parse_all(results)
    results.map do |row_hash|
      self.new(row_hash)
    end
  end

  def self.find(id)
    found = DBConnection.execute(<<-SQL, id)
      SELECT 
      * 
      FROM 
      #{self.table_name}
      WHERE 
      id = ?
      SQL
    parsed = self.parse_all(found)
    parsed.first
  end

  def initialize(params = {})
    params.each_pair do |column,value|
      if self.class.columns.include?(column.to_sym)
          self.send("#{column.to_sym}=",value)
      else 
        raise "unknown attribute '#{column}'"
      end
    end
  
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    values = self.class.columns.map do |column|
        self.send(column)
    end
    values
  end

  def insert
    col_names = self.class.columns.drop(1).join(", ")
    question_marks = (["?"] * self.class.columns.drop(1).size).join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values[1..-1])
      INSERT INTO
       #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL

      new_id = DBConnection.last_insert_row_id
      self.id = new_id
  end

  def update
    cols = self.class.columns.drop(1).map { |attribute| "#{attribute} = ?" }  
    joined = cols.join(",")



    DBConnection.execute(<<-SQL, *self.attribute_values, self.id )
      UPDATE
       #{self.class.table_name} 
      SET
        #{joined}
      WHERE
        id = ?
      SQL
  end

  def save
    if self.class.all.include?(self)
      self.update
    else 
      self.insert
    end
  end
end
