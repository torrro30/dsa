

class TimerController < ApplicationController

    def index
    
    end

    def get_worlds
        available_worlds = TimerHelper::fetch_world_list()
        
        respond_to do |format|
            format.json { render :json => available_worlds }
        end
    end

end
