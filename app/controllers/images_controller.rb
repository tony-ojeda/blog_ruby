require 'base64'
class ImagesController < ApplicationController
    def new
        @article = Article.find(params[:article_id])
        @image = @article.images.build
    end

    def edit
        @article = Article.find(params[:article_id])
        @image = @article.images.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:article_id])
        @image = @article.images.find(params[:id])
        @image.destroy
        redirect_to articles_path
    end

    def update 
        @article = Article.find(params[:article_id])
        @image = @article.images.find(params[:id])
        image = params[:image][:image]
        
        if @image.update_attributes(image: Base64.encode64(image.read))
            redirect_to @article
        else
            render action: "edit"
        end
    end

    def create
        @article = Article.find(params[:article_id])
        @image = @article.images.build(image_params)
        image = params[:image][:image]
        @image.image = Base64.encode64(image.read)
        if @image.save
            redirect_to @article
        else
            render action: "new"
        end
    end

    private
        def image_params
            params.require(:image).permit(:image)
        end

end
