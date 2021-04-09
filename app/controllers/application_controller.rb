require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        
        erb :super_hero
    end

    post '/teams' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]

        @hero_name = []
        @hero_power = []
        @hero_bio = []

        @team_members = params[:team][:members]
        @team_members.each do |member|
            @hero_name << member[:name]
            @hero_power << member[:power]
            @hero_bio << member[:biography]
        end
        erb :team
    end
end
