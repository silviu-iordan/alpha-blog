class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    

    def show
        #@article = Article.find(params[:id])
    end

    def index
       @articles = Article.all        
    end

    def new
        @article = Article.new
    end

    def edit
        #@article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)  # witlisting the param that comes from the Internet
        @article.user = User.first                                                                                                                                                                                                      
        #render plain: @article.inspect  
        if @article.save
        #redirect_to article_path(@article)
            flash[:notice] = "Article was created succesfully!"
            redirect_to @article         # this will redirect to the article route(path): /articles/:id
        else
            render 'new'
        end
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

    def update
        #@article = Article.find(params[:id])
        if @article.update(article_params) 
            flash[:notice] = "Article was updated succesfully."
            redirect_to @article
        else
            render 'edit'
        end    
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path        
    end

    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end