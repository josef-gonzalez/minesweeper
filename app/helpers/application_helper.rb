module ApplicationHelper

    def class_name(tile)
        if tile.revealed
            case tile.value 
                when nil
                    return 'btn-secondary bg-light disabled'
                when 'x'
                    return 'btn-danger'
                else
                    return 'btn-success'
            end
        else
            return 'btn-secondary'
        end
    end

end
