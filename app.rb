require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("./lib/project")
require("pg")


DB = PG.connect({:dbname => "volunteer_tracker"})


get("/") do
@projects = Project.all
(erb :index)
end

post("/") do
title = params["title"]
project = Project.new({title: title, id: nil})
project.save
redirect "/"
end

get("/projects/:id") do
@edit = false
project_id = params[:id].to_i
@project = Project.find(project_id)
(erb :project_info)
end

get("/projects/:id/edit") do
  @edit = true
  project_id = params[:id].to_i
  @project = Project.find(project_id)
  (erb :project_info)
end

post("/projects/:id") do
project_id = params[:id].to_i
new_title = params[:title]
@project = Project.find(project_id)
@project.update({title: new_title})
(erb :project_info)
end

delete("/projects/:id/edit") do
project_id = params[:id].to_i
project = Project.find(project_id)
project.delete
redirect "/"
end


# post("/doctor") do
#   if (params[:doc_name] == "") || (params[:doc_specialty] == "")
#     redirect "/"
#   else
#     doc_entry = params[:doc_name]
#     doc_specialty = params[:doc_specialty]
#     new_doctor = Doctor.new(:name => doc_entry, :specialty => doc_specialty, :id => nil)
#     new_doctor.save
#     # @doctors = Doctor.all
#     redirect "/"
#   end
# end
#
# post("/patient") do
#   if (params[:patient_name] == "") || (params[:birth_date] == "")
#     redirect "/"
#   else
#     name = params[:patient_name]
#     birth_date = params[:patient_dob]
#     new_patient = Patient.new(:name => name, :birth_date => birth_date, :id => nil)
#     new_patient.save
#     redirect "/"
#   end
# end
#
# get("/tasks/:id") do
# @list_id = params[:id].to_i
# @list = List.find_list(@list_id)
# @tasks = @list.tasks
#
# (erb :tasks)
# end
#
#
# post("/tasks/:id") do
# list_id = params[:id]
# task_description = params[:task_entry]
#   if (task_description == "")
#     redirect "/tasks/#{list_id}"
#   else
#     task = Task.new(:description => task_description, :list_id => list_id)
#     task.save
#     redirect "/tasks/#{list_id}"
#   end
# end
