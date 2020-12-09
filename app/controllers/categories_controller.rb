class CategoriesController < ApplicationController

    def new
        @category = Category.new
    end

    def create
        #we need to create the instance variable and whitelist the params that it will be introduced
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category was succesfully created"
            redirect_to @category
        else
            render 'new'
        end
    end

    def index

    end

    def show
        @category = Category.find(params[:id])
    end

    private
    #this will be the private methot taht will be used to whitelist the params introduced intto the new/create form
    #we need to whitelist the params because they are introduced from Internet and they are not secured
    def category_params
        params.require(:category).permit(:name)
    end
end