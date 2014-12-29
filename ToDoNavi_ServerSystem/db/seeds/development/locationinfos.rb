long = %w(139.544165813226 139.543469065139 139.543044947319 139.543581085487 139.544640477625 139.564320900536 139.563988199463 139.565777106543 139.567590796419 139.567315908633 139.563781493524 139.563001433802 139.563338575090)
lat = %w(35.611237352859 35.611279966283 35.610901448445 35.610201073227 35.611044412351 35.616472533883 35.615918492071 35.615452716230 35.613889954020 35.615665856560 35.616712601071 35.616105574230 35.615886299231)
s_num = %W(4 4 4 4 4 3 3 2 2 2 1 1 1)

0.upto(12) do |index|
  Locationinfo.create(
    location_info_number: index + 201,
    long: long[index],
    lat: lat[index],
    store_number: s_num[index],
    store_id: s_num[index]
  )
end