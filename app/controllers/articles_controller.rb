require 'base64'
class ArticlesController < ApplicationController
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

    def show 
    end

    private
        def article_params
            params.require(:article).permit(:name, :content, :main_image)
        end
end
