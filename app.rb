require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "lib/team_data"

team_data = TeamData.to_h

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = team_data.keys
  erb :teams
end

get "/positions" do
  @positions = team_data["Simpson Slammers"].keys
  erb :positions
end

get "/positions/:position" do
  @position_name = params[:position]
  @team_data = team_data
  erb :position
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @players = team_data[params[:team_name]]
  erb :team
end
