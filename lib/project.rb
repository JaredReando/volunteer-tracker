require 'pry'

class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all()
    projects = []
    projects_db_row = DB.exec("SELECT * FROM projects")
    projects_db_row.each do |row|
      title = row["title"]
      id = row["id"].to_i
      project_id = row["projects_id"]
      project = Project.new({:title => title, :id => id})
      projects.push(project)
    end
    projects
  end

  def self.find(project_id)
    found_project = nil
    all_projects = Project.all
    all_projects.each do |project|
      if project.id == project_id
        found_project = project
      end
    end
    found_project
  end

  def save
    values = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id")
    @id = values.first["id"].to_i
  end

  def ==(other_instance)
    @title == other_instance.title
  end
end
