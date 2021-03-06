# coding: utf-8
class Admin::ItemsController < Admin::Base

  def index
    @items = Item.all.paginate(page: params[:page], per_page: 20)
    @genres = Genre.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    @genres.each do |genre|
      if genre.genre_number == @item.genre_number
        @item.genre_id = genre.id
        break
      end
    end
    if @item.save
      redirect_to :admin_items, notice: "商品情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)
    if @item.save
      redirect_to :admin_items, notice: "商品情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :admin_items, notice: "商品を削除しました。"
  end

  def search
    genre = ''
    item = ''
    params[:genre].each do |index|
      genre = index
    end

    params[:item].each do |index|
      item = index
    end

    @items = Item.search(genre, item).paginate(page: params[:page], per_page: 20)
    @genres = Genre.all
    render "index"
  end

  def item_params
    params.require(:item).permit(:item_number, :item_name, :genre_number)
  end

end
