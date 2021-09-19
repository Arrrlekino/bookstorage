class BooksController < ApplicationController
    def topic
         @topic = Topic.find_by(alias: params[:topic])
         @books = @topic.books
         render 'index'
       end
       def author
         @author = Author.find_by(name: params[:author])
         @books = @author.books
         render 'index'
       end
    def new
        @authors = Author.all()
        @topics = Topic.all()
        @book = Book.new
      end
    
      def create
        @book = Book.new book_params
        if @book.save
          redirect_to root_path
        else
          render :new
        end
      end
    
      def index
        @books = Book.all
      end
    
      def show
        @book = Book.find params[:id]
      end
    
      def destroy
        @book = Book.find params[:id]
        @book.destroy
        redirect_to books_path
      end
    def edit
      @book = Book.find params[:id]
    end
  
    def update
      @book = Book.find params[:id]
      if @book.update(book_params)
        redirect_to '/books/' + @book.id.to_s
    #redirect_to after_save_path, notice: 'успешно изменено'
      else
        render :index
      end
    end
  
    private
    
    def book_params
      params.require(:book).permit(:title, :cover, :topic_id, author_ids: [])
    end
  end