require 'base64'
class ArticlesController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_article, only: [:edit, :show, :update, :destroy]
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if (params[:article][:main_image]) 
            main_image = params[:article][:main_image]
            @article.main_image = Base64.encode64(main_image.read)
        end
        if @article.save
            flash[:notice] = "Se guardó el artículo conrrectamente."
            redirect_to @article
        else
            flash[:error] = "No se pudo guardar. Los campos de nombre y contenido deben de estar llenos."
            render action: "new"
        end
    end

    def edit
    end

    def show 
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    def update
        
        if @article.update(article_params)
            if params[:article][:main_image]
                main_image = params[:article][:main_image]
                @article.main_image = Base64.encode64(main_image.read)
            end
            flash[:notice] = "Se guardó el artículo conrrectamente."
            @article.update_attributes(main_image: main_image)
            redirect_to @article
        else
            flash[:error] = "No se pudo guardar. Los campos de nombre y contenido deben de estar llenos."
            render action: "edit"
        end
    end

    private
        def article_params
            params.require(:article).permit(:name, :content, :main_image)
        end

        def set_article
            @article = Article.find(params[:id])
        end
end
