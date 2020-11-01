class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
       @articles = Article.all        
    end

    def new
        @article = Article.new
    end

    def edit
        
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))  # witlisting the param that comes from the Internet
        #render plain: @article.inspect  
        if @article.save
        #redirect_to article_path(@article)
            flash[:notice] = "Article was created succesfully!"
            redirect_to @article         # this will redirect tp the article route(path): /articles/:id
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description)) 
            flash[:notice] = "Article was updated succesfully."
            redirect_to @article
        else
            render 'edit'
        end    
    end
end