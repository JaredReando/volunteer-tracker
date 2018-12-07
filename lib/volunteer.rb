require 'pry'

class Volunteer
  attr_reader(:name, :id, :project_id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  def self.all()
    volunteers = []
    volunteers_db_row = DB.exec("SELECT * FROM volunteers")
    volunteers_db_row.each do |row|
      name = row["name"]
      id = row["id"].to_i
      project_id = row["projects_id"]
      volunteer = Volunteer.new({:name => name, :id => id, :project_id => project_id})
      volunteers.push(volunteer)
    end
    volunteers
  end

  def self.find(volunteer_id)
    found_volunteer = nil
    all_volunteers = Volunteer.all
    all_volunteers.each do |volunteer|
      if volunteer.id == volunteer_id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  def save
    values = DB.exec("INSERT INTO volunteers (name, projects_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id")
    @id = values.first["id"].to_i
  end

  def update(params)
    @name = params[:name]
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id}")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id}")
  end


  def ==(other_instance)
    @name == other_instance.name
  end
end


  # def tasks
  #   list_tasks = []
  #   tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{@id}")
  #   tasks.each do |task|
  #     description = task["description"]
  #     list_id = task["list_id"]
  #     list_tasks.push(Task.new({:description => description, :list_id => list_id}))
  #   end
  #   list_tasks
  # end
