class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :null_session
  protected
    # Use callbacks to share common setup or constraints between actions.
    def token
    	session = Session.find_by authtoken: (params[:authtoken])
    	t = session.date
    	segundos = (Time.now - session.date).to_i
    	 minutos = (segundos/60).to_i
    	if minutos<30
    		session.date = Time.now
    		session.save
    	else    			
    		session.destroy
    		render json: "session terminada" , status: :unauthorized 
    	end
    end
end
