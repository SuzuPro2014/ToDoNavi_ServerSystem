# coding: utf-8
class Admin::ItempricesController < Admin::Base
  
  def index
    @itemprices = Itemprice.all.paginate(page: params[:page], per_page: 20)
    @items = Item.all
    @stores = Store.all
  end

  def new
    @itemprice = Itemprice.new
  end

  def edit
    @itemprice = Itemprice.find(params[:id])
  end

  def create
    @itemprice = Itemprice.new(itemprice_params)
    @items = Item.all
    @stores = Store.all
    @itemprice.item_id = itemSearch(@itemprice, @items)
    @itemprice.store_id = storeSearch(@itemprice, @stores)
    if @itemprice.save
      redirect_to :admin_itemprices, notice: "商品価格情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @itemprice = Itemprice.find(params[:id])
    @items = Item.all
    @stores = Store.all
    @itemprice.item_id = itemSearch(@itemprice, @items)
    @itemprice.store_id = storeSearch(@itemprice, @stores)
    @itemprice.assign_attributes(itemprice_params)
    if @itemprice.save
      redirect_to :admin_itemprices, notice: "商品価格情報を編集しました。"
    else
      render "edit"
    end
  end

  def destroy
    @itemprice = Itemprice.find(params[:id])
    @itemprice.destroy
    redirect_to :admin_itemprices, notice: "商品価格情報を削除しました。"
  end

  def itemprice_params
    params.require(:itemprice).permit(:item_number, :store_number, :prices)
  end

  def itemSearch(price, items)
    @result = ""
    items.each do |item|
      if price.item_number == item.item_number
        @result = item.id
        break
      end
    end
    return @result
  end

  def storeSearch(price, stores)
    @result = ""
    stores.each do |store|
      if price.store_number == store.store_number
        @result = store.id
        break
      end
    end
    return @result
  end

  def search
    item = ''
    store = ''

    params[:store].each do |index|
      store = index
    end
    params[:item].each do |index|
      item = index
    end

    @itemprices = Itemprice.priceSearch(store, item).paginate(page: params[:page], per_page: 20)
    @stores = Store.all
    @items = Item.all
    render "index"
  end
  
end
