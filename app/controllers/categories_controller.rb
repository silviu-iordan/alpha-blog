class CategoriesController < ApplicationController
    #before_action will execute function "require_admin" before any other function
    #it will no be executed before actions index and show because the admin rights should apply to create a new and create actions
    before_action :require_admin, except: [:index,:show]

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
        #we need to add pagination, max 5 categories per page
        @categories = Category.paginate(page: params[:page], per_page: 5)
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

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admins can perform this action"
            redirect_to categories_path
        end
    end
end