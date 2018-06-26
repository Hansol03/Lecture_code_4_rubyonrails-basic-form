class UsersController < ApplicationController
  def signup 
  end

  def register
    @msg = ""
      # 만약에 params[:password] == params[:repassword]
    # 회원가입 시킨다. @msg = "회원가입이 완료되었습니다."
    # 아닌 경우
    # @msg = "비밀번호가 일치하지 않습니다."
    if params[:password] == params[:repassword]
      if User.find_by(username: params[:username])
      @msg = "중복된 아이디가 있습니다"
    else
      User.create(
        username: params[:username],
        password: params[:password]
        )
        @msg = "회원가입이 완료되었습니다"
      end
      else
        @msg = "비밀번호가 일치하지 않습니다"
    end
  end
  
  def login
  end
  
  def logining
    @msg = ""
    user = User.find_by(username: params[:username])
    if user and user.password == params[:password]
      session[:id] = user.id
    #만약에 DB에 해당하는 아이디의 사람이 있으면 && 비번까지 같으면
    #로그인 시킨다. ==seesion[:id]
    @msg = "로그인 되었습니다."
    #아니면
    #로그인 안시킨다
    #@msg = "아이디나 비번이 틀렸씁니다."
  else
    @msg = "꺼져"
    end
  end
  def logout
    session.clear
    redirect_to '/'
  end

  def getout
    user = User.find(session[:id])
    user.destroy
    session.clear
    redirect_to '/'
  end
end
