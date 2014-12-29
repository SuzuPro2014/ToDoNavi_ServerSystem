# coding: utf-8
class Admin::LocationinfosController < Admin::Base

  def index
    @locationinfos = Locationinfo.all.paginate(page: params[:page], per_page: 20)
    @stores = Store.all
  end

  def new
    @locationinfo = Locationinfo.new
  end

  def edit
    @locationinfo = Locationinfo.find(params[:id])
  end

  def create
    @locationinfo = Locationinfo.new(locationinfo_params)
    @stores = Store.all
    @locationinfo.store_id = storeSearch(@locationinfo, @stores)
    if @locationinfo.save
      redirect_to :admin_locationinfos, notice: "位置情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @locationinfo = Locationinfo.find(params[:id])
    @stores = Store.all
    @locationinfo.store_id = storeSearch(@locationinfo, @stores)
    @locationinfo.assign_attributes(locationinfo_params)
    if @locationinfo.save
      redirect_to :admin_locationinfos, notice: "位置情報を編集しました。"
    else
      render "edit"
    end
  end

  def destroy
    @locationinfo = Locationinfo.find(params[:id])
    @locationinfo.destroy
    redirect_to :admin_locationinfos, notice: "位置情報を削除しました。"
  end

  def locationinfo_params
    params.require(:locationinfo).permit(:location_info_number, :long, :lat,:store_number)
  end

  def storeSearch(location, stores)
    @result = ""
    stores.each do |store|
      if location.store_number == store.store_number
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
    @locationinfos = Locationinfo.locationSearch(store).paginate(page: params[:page], per_page: 20)
    @stores = Store.all
    render "index"
  end
  
end
