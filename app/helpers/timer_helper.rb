require 'net/https'

module TimerHelper

    def self.fetch_world_list
        http = Net::HTTP.new 'oldschool.runescape.com'
        request = Net::HTTP::Get.new '/slu'
        response = http.request request
        
        html = response.body
        
        worlds_list = html.scan(/\se\((\d+),(\w+),.*?\)/)
        
        worlds_list.map! do |world_number, is_members|
            [world_number.to_i, is_members == 'true']
        end
        
        worlds_list.sort! do |a, b|
            a[0] <=> b[0]
        end
        
        worlds_list
    end

end
