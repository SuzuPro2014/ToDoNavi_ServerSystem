# coding: utf-8
class Admin::StoresController < Admin::Base

  def index
    @stores = Store.all.paginate(page: params[:page], per_page: 20)
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def edit
    @store = Store.find(params[:id])
    @open = integerConverter(@store.open_time)
    @close = integerConverter(@store.close_time)
  end

  def create
    @store = Store.new(store_params)
    if @store.open_time.class() == Fixnum
      @store.open_time = secondConverter(@store.open_time)
    end
    if @store.close_time.class() == Fixnum
      @store.close_time = secondConverter(@store.close_time)
    end
    if @store.save
      redirect_to [:admin, @store], notice: "店舗情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @store = Store.find(params[:id])
    @store.assign_attributes(store_params)
    if @store.open_time.class() == Fixnum
      @store.open_time = secondConverter(@store.open_time)
    end
    if @store.close_time.class() == Fixnum
      @store.close_time = secondConverter(@store.close_time)
    end
    if @store.save
      redirect_to [:admin, @store], notice: "店舗情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to :admin_stores, notice: "店舗情報を削除しました。"
  end

  def search
    @stores = Store.search(params[:q]).paginate(page: params[:page], per_page: 20)
    render "index"
  end

  def store_params
    params.require(:store).permit(:store_number, :store_name, :address, :phone_number, :open_time, :close_time)
  end

  def secondConverter(time)
    @hour = (time / 100) * 3600
    @minute = (time % 100) * 60
    @result = @hour + @minute
    return @result
  end

  def integerConverter(time)
    @hour = (time / 3600) * 100
    @minute = (time % 3600) /60
    @result = @hour + @minute
    return @result
  end
  
end
