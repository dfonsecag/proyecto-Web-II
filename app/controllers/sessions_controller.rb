class SessionsController < ApplicationController
 before_action :token, only: [ :update, :destroy]
 def index
  @sessions = Session.all
  render json: {
    status: 200,
    message: @sessions
    }.to_json
  end
  def create

    user = User.find_by username: (params[:username])
    time = Time.now
    if user && user.authenticate(params[:password])
      
      salt  = SecureRandom.random_bytes(1)
      key   = ActiveSupport::KeyGenerator.new('password').generate_key(salt) # => "\x89\xE0\x156\xAC..."
      crypt = ActiveSupport::MessageEncryptor.new(key)                       # => #<ActiveSupport::MessageEncryptor ...>
      encrypted_data = crypt.encrypt_and_sign(time)  
      session = Session.new()         
      session.date = time
      session.authtoken = encrypted_data
      session.username = (params[:username])
      session.save
      render json: 'authtoken:   ' + encrypted_data , status: :ok 
    else 
     render json: 'Error: User or password invalid', status: :unprocessable_entity
   end

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
