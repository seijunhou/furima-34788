require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
      context '保存できる場合' do
        it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end

      end


    
      context '保存できない場合' do
        it 'nameが空では登録できないこと' do
          @user.nick_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nick name can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'first_nameは空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end 

        it 'last_nameは空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_name_kanaはからでは登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'last_name_kanaは空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'tannjoubiは空では登録できない' do
          @user.tannjoubi = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Tannjoubi can't be blank")
        end



        
        it 'passwordは英語のみでは登録できないこと' do
          @user.password = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it 'passwordは数字のみでは登録できないこと' do
          @user.password = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordは全角では登録できないこと' do
          @user.password = 'あいう'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'emailは＠を含むこと' do
          @user.email = 'test.co.jp'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.first_name = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end

        it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
          @user.last_name = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
        end

        it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
          @user.first_name_kana = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana 全角文字を使用してください')
        end

        it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
          @user.last_name_kana = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
        end
      end  
    end
end
