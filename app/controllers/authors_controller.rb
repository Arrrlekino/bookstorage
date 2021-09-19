class AuthorsController < ApplicationController
    def new
      @author = Author.new
    end
  
    def create
      @author = Author.new author_params
      if @author.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def index
      @authors = Author.all
    end
  
    def show
      @author = Author.find params[:id]
    end

    def edit
        @author = Author.find params[:id]
      end
    
      def update
        @author = Author.find params[:id]
        if @author.update(author_params)
         redirect_to '/authors/' + @author.id.to_s
    #redirect_to after_save_path, notice: 'успешно изменен'
        else
          render :edit
        end
      end
  
    def destroy
     @author = Author.find params[:id]
      @author.destroy
      redirect_to authors_path
     # if @author.destroy
    #  redirect_to [@book, :author], notice: 'успешно удален'
    # else
    #   redirect_to [@book, :author], alert: 'Не удалось удалить'
    # end
    end
  
    private
  
    def author_params
      params.require(:author).permit(:name, book_ids: [])
    end
  end