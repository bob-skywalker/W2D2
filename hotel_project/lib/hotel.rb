require_relative "room"

class Hotel
    def initialize(name,hash)
        @name = name
        @rooms = {}

        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        word = @name.split(" ")

        new_str = word.map {|el| el.capitalize}
        return new_str.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
       if @rooms.has_key?(name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |k,v|
            if @rooms[k].full?
                return false
            else
                return true
            end
        end

    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k} : #{v.available_space}"
        end
    end


end
