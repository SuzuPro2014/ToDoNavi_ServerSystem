# coding: utf-8
class Admin::GenresController < Admin::Base
  
  def index
    @genres = Genre.all.paginate(page: params[:page], per_page: 20)
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to :admin_genres, notice: "ジャンル情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.assign_attributes(genre_params)
    if @genre.save
      redirect_to :admin_genres, notice: "ジャンル情報を編集しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to :admin_genres, notice: "ジャンルを削除しました。"
  end

  def genre_params
    params.require(:genre).permit(:genre_number, :genre_name)
  end
  
end
