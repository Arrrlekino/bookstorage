class TopicsController < ApplicationController
    before_action :set_topic!, only: %i[show destroy edit update]
  
    def show
      @book = @topic.books.build
      @Books = Book.order created_at: :desc
    end
  
    def destroy
      @topic.destroy
      flash[:success] = "topic deleted!"
      redirect_to topics_path
    end
  
    def edit
    end
  
    def update
      if @topic.update topic_params
        flash[:success] = "topic updated!"
        redirect_to topics_path
      else
        render :edit
      end
    end
  
    def index
      @topics = Topic.all
    end
  
    def new
      @topic = Topic.new
    end
  
    def create
      @topic = Topic.new topic_params
      if @topic.save
        flash[:success] = "topic created!"
        redirect_to topics_path
      else
        render :new
      end
    end
  
    private
  
    def topic_params
      params.require(:topic).permit(:title)
    end
  
    def set_topic!
      @topic = Topic.find params[:id]
    end
  end