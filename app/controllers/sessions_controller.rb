class SessionsController < ApplicationController


  def create

    user = User.find_by username: (params[:username])
    if user && user.authenticate(params[:password])
      cookies[:user_name] = "david"
      #session[:authtoken] = "223j23hj23hsdj"
      session[:time] = DateTime.now
      render json: {
        status: 200,
        message: cookies[:user_name] 
        }.to_json
        else
         render json: {
          status: 422,
          message: "error: User or password invalid"
          }.to_json
        end

      end
      def hora
       cookies[:user_name] = "david"
        
         render json: {
          status: 422,
          }.to_json
      end
      def datetime
       
        
         render json: {
          status: 422,
          message: cookies[:user_name] 
          }.to_json
      end
      def destroy
        log_out if logged_in?
        redirect_to root_path
      end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:session).permit(:username, :password)
    end
  end
