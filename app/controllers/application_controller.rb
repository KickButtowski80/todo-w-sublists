class ApplicationController < ActionController::Base
    
     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :set_todo_list
     
     protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      end
      
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])      
    end
    
end
