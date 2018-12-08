require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @projects = Project.all
  @volunteers = Volunteer.all
  (erb :index)
end

post("/") do
  title = params["title"]
  project = Project.new({title: title, id: nil})
  project.save
  redirect "/"
end

post("/volunteers/add") do
  name = params[:name]
  @project_id = params[:project_id].to_i
  volunteer = Volunteer.new({name: name, project_id: @project_id})
  volunteer.save
  redirect "/projects/#{@project_id}"
end

get("/volunteers/:id/edit") do
  volunteer_id = params[:id].to_i
  @volunteer = Volunteer.find(volunteer_id)
  @project_id = @volunteer.project_id
  (erb :volunteer_info)
end

patch("/volunteers/:id/edit") do
  volunteer_id = params[:id].to_i
  new_name = params[:name]
  @volunteer = Volunteer.find(volunteer_id)
  @volunteer.update({name: new_name})
  project_id = @volunteer.project_id
  redirect "/projects/#{project_id}"
end

get("/projects/:id") do
  @edit = false
  project_id = params[:id].to_i
  @project = Project.find(project_id)
  @project_volunteers = @project.volunteers
  (erb :project_info)
end

get("/projects/:id/edit") do
  @edit = true
  project_id = params[:id].to_i
  @project = Project.find(project_id)
  @project_volunteers = @project.volunteers
  (erb :project_info)
end

post("/projects/:id") do
  project_id = params[:id].to_i
  new_title = params[:title]
  @project = Project.find(project_id)
  @project.update({title: new_title})
  @project_volunteers = @project.volunteers
  (erb :project_info)
end

delete("/projects/:id/edit") do
  project_id = params[:id].to_i
  project = Project.find(project_id)
  project.delete
  redirect "/"
end
