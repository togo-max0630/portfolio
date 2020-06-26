require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前とメールアドレスとパスワードがあれば登録できる"
    expect(FactoryBot.create(:user)).to be_valid

  it "名前がなければ登録できない"
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 

  it "ニックネームがなければ登録できない"
    expect(FactoryBot.build(:user, nickname: "")).to_not be_valid

  it "郵便番号がなければ登録できない"
    expect(FactoryBot.build(:user, postal_code: "")).to_not be_valid 

  it "住所があり文字数が7文字でなければ登録できない"
    expect(FactoryBot.build(:user, residence: "")).to_not be_valid  

  it "メールアドレスがなければ登録できない"
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 

  it "メールアドレスが重複していたら登録できない"
    user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to_not be_valid

  it "パスワードがなければ登録できない"
    expect(FactoryBot.build(:user, password: "")).to_not be_valid

  it "パスワードが暗号化されているか"
      user = FactoryBot.create(:user)
    expect(user.password_digest).to_not eq "password"
  end 

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 

end
