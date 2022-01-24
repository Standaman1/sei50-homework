class MagiceightballsController < ApplicationController

    def home
        
    end

    def question
       
        @question = params[:questionasked].capitalize

        @answer = [
            "It is certain.",
            "As I see it, yes.",
            "Reply hazy, try again.",
            "Don't count on it.",
            "Ask again later.",
            "My reply is no."].sample
    end

end #class MagiceightballsController