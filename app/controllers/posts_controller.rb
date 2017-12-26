class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all.reverse
  end

  def new

  end

  def create
    # Post.create(
    #   title: params[:title],
    #   content: params[:content]
    # )
    # 위의 로직을 다음과 같이 두 단계로 나누어 바꿀 수 있음.
    @post = Post.new(post_params)
    # new를 이용하면 DB에 바로 저장되지 않고 행하나가 만들어지고 데이터가 삽입 됨.(메모리에 임시 저장)
    # .save를 하면 비로소 DB에 저장 됨. 이런 투스텝의 장점은 조건문을 걸 때 유용하다.
    if @post.save
      redirect_to '/'
    else
      flash[:alert] = "You have to fill up title and content"
      redirect_to :back
      # back을 해서 다시 new로 감
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)

    # 레일즈는 @post의 id를 찾아서 리다이렉트 해준다. 이제 밑의 두개의 코드대신 바로 밑의 코드로 사용가능.
    redirect_to @post
    # redirect_to "/posts/#{@post.id}"
    # redirect_to "/posts/show/#{params[:id]}"
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

private
# private을 통해 해당 클래스 내에서만 사용 가능케 함. MVC logic과 상관없는 메소드만 private로 선언.
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
     params.require(:post).permit(:title, :content)
     # 위의 코드를 통해 다음과 같이 스트롱 파라미터를 받음
     # params[:post][:title]
     # params[:post][:content]
  end
end
