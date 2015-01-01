class TodonavisController < ApplicationController

  $stores = []
  
  def index
  end

  def genrePrint
    genres = Genre.all
    genre = []
    genres.each do |g|
      genre += [[g.genre_number, g.genre_name]]
    end
    render text: genre
  end

  def itemPrint
    genreID = params[:id]
    items = []
    Item.where(:genre_number => genreID).find_each do |item|
      items += [[item.item_number, item.item_name]]
    end
    render text: "#{items}"
  end

  def locationSearch
    lat = params[:lat]
    long = params[:long]
    lat10p = plus10km_lat(lat)
    lat10m = minus10km_lat(lat)
    long10p = plus10km_long(long)
    long10m = minus10km_long(long)

    day = Time.now
    time = "#{day.hour}#{day.min}"
    time = time.to_i
    if time < 200
      time = time + 2400
    end
    time = secondConverter(time)

    l_store = []
    Locationinfo.search(lat10m, lat10p, long10m, long10p).each do |location|
      l_store += [location.store_number]
    end
    l_store = l_store.uniq
    l_store = l_store.sort

    t_store = []
    Store.all.each do |store|
      if time >= store.open_time && time < store.close_time
        t_store += [store.store_number]
      end
    end

    result = []
    l_store.each do |l|
      t_store.each do |t|
        if l == t
          result += [l]
        end
      end
    end
    
    if result.size < 1 then
      render text: false
    else
      result = result.uniq
      $stores = result
      render text: true
    end
  end

  def wifiSearch
    ssid = params[:ssid]
    bssid = params[:bssid]
    index = 0
    wifiArray = Array.new
    while index < bssid.size
      wifiArray.push([ssid[index], bssid[index]])
      index += 1
    end
    wifiinfos = Wifiinfo.all
    result = []
    wifiArray.each do |wifi|
      Wifiinfo.search(wifi[0], wifi[1]).each do |info|
        result += [info.store_number]
      end
    end
    result2 = []
    $stores.each do |store|
      result.each do |result|
        if store == result
          result2 += store
        end
      end
    end
    
    if result2.size < 1 then
      render text: false
    else
      result2 = result2.uniq
      $stores = result2
      render text: true
    end
  end

  def itemSearch
    items = params[:item]
    itemprice = Itemprice.all
    result = []
    $stores.each do |store|
      items.each do |item|
        Itemprice.search(store, item).each do |info|
          result += [[info.store_number, info.item_number, info.prices]]
        end
      end
    end
    render text: "#{result}"
  end

  def plus10km_lat(lat)
    result = BigDecimal(lat) + BigDecimal("0.0901344651247307")
    return result
  end

  def minus10km_lat(lat)
    result = BigDecimal(lat) - BigDecimal("0.0901344651247307")
    return result
  end

  def plus10km_long(long)
    result = BigDecimal(long) + BigDecimal("0.1100328777975837")
    return result
  end

  def minus10km_long(long)
    result = BigDecimal(long) - BigDecimal("0.1100328777975837")
    return result
  end

  def secondConverter(time)
    hour = (time / 100) * 3600
    minute = (time % 100) * 60
    result = hour + minute
    return result
  end
  
end
