require 'base64'
class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        main_image = params[:article][:main_image]
        @article.main_image = Base64.encode64(main_image.read)
        if @article.save
            redirect_to @article
        else
            render action: "new"
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def show 
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            if params[:article][:main_image]
                main_image = params[:article][:main_image]
                @article.main_image = Base64.encode64(main_image.read)
            end
            @article.update_attributes(main_image: main_image)
            redirect_to @article
        else
            render action: "edit"
        end
    end

    private
        def article_params
            params.require(:article).permit(:name, :content, :main_image)
        end
end
