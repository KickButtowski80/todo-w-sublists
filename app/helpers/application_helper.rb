module ApplicationHelper
    def completed?(list)
        if list.completed           
            'table-dark animation'
        elsif list.status == 'low'
            'table-light'
        elsif list.status == 'medium'
            'table-success'
        elsif list.status == 'high'
            'table-warning'
        elsif list.status == 'urgent'
            'table-danger'
        end        
    end
    
    def complete_status(list)
        list.completed ? "complete" : "un-complete"
    end
    
    def count(user)
      user.increment!(:sign_in_count)
    end
end
