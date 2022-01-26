require "sinatra"
require "sinatra/reloader"
require "sqlite3"


def db_query(sql)

    puts "=======================/n/n"
    puts sql
    puts "/n========================="

    db = SQLite3::Database.new "database.db"
    db.results_as_hash = true
    results = db.execute sql
    db.close

    results #implicit return
end


#CREATE




#READ

get "/" do
    erb :home
end #get /



get "/nflplayers" do
db = SQLite3::Database.new "database.db"
db.results_as_hash = true
@results = db.execute "SELECT * FROM nflplayers;"
db.close

erb :index

end #get /nflplayers


get "/nflplayers/:id" do

    @nflplayer = db_query "SELECT * FROM nflplayers WHERE id = #{params[:id]};"
    @nflplayer = @nflplayer.first

    erb :show
end #get nfl/players/:id



#UPDATE -----------

get "/nflplayers/:id/edit" do
    @nflplayer = db_query "SELECT * FROM nflplayers WHERE id = #{params[:id]};"
    @nflplayer = @nflplayer.first

    erb :edit

end #get /nflplayers/:id/edit


post "nflplayers/:id" do

    update_sql = "
    UPDATE nflplayers SET
        lastname = '#{params[:lastname]}', 
        firstname = '#{params[:firstname]}',
        position = #{params[:position]},
        week = '#{params[:week]}', 
        fantasypoints = #{params[:fantasypoints]}, 
        image_url = '#{params[:image_url]}'
        WHERE id = #{params[:id]};
    "
db_query update_sql

redirect "/nflplayers/#{ params[:id] }" #Go to show page for the edited item

end