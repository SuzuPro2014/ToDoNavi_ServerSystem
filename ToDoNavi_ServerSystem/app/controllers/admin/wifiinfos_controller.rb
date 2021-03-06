# coding: utf-8
class Admin::WifiinfosController < Admin::Base

  def index
    @wifiinfos = Wifiinfo.all.paginate(page: params[:page], per_page: 20)
    @stores = Store.all
  end

  def new
    @wifiinfo = Wifiinfo.new
  end

  def edit
    @wifiinfo = Wifiinfo.find(params[:id])
  end

  def create
    @wifiinfo = Wifiinfo.new(wifiinfo_params)
    @stores = Store.all
    @wifiinfo.store_id = storeSearch(@wifiinfo, @stores)
    if @wifiinfo.save
      redirect_to :admin_wifiinfos, notice: "Wi-Fi情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @wifiinfo = Wifiinfo.find(params[:id])
    @stores = Store.all
    @wifiinfo.store_id = storeSearch(@wifiinfo, @stores)
    @wifiinfo.assign_attributes(wifiinfo_params)
    if @wifiinfo.save
      redirect_to :admin_wifiinfos, notice: "Wi-Fi情報を編集しました。"
    else
      render "edit"
    end
  end

  def destroy
    @wifiinfo = Wifiinfo.find(params[:id])
    @wifiinfo.destroy
    redirect_to :admin_wifiinfos, notice: "Wi-Fi情報を削除しました。"
  end

  def wifiinfo_params
    params.require(:wifiinfo).permit(:wifi_info_number, :ssid, :bssid, :store_number)
  end

  def storeSearch(wifi, stores)
    @result = ""
    stores.each do |store|
      if wifi.store_number == store.store_number
        @result = store.id
        break
      end
    end
    return @result
  end

  def search
    store = ''
    params[:store].each do |index|
      store = index
    end
    @wifiinfos = Wifiinfo.wifiSearch(store).paginate(page: params[:page], per_page: 20)
    @stores = Store.all
    render "index"
  end  
end
