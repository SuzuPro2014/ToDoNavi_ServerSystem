users = %w(serverAdmin surveyAdmin developAdmin planAdmin)
pass = %w(BLSdwR8t sgXTQGe3 Sg7C2nLL U2b4Y8aJ)

0.upto(3) do |index|
  Adminuser.create(user: users[index],
                   password: pass[index],
                   password_confirmation: pass[index],
                   administrator: true
                  )
end
