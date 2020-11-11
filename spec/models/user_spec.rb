require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規作成' do
    context '新規登録がうまくいく時' do
      it 'nickname、email、password、password_confirmation、full_name、full_name_kana、phone_numberが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上(半角英数字混同)であれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
      it 'emailで登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'nicknameが同じ値だと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, nickname: @user.nickname)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('ニックネームはすでに存在します')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが５文字以下だと登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが半角英数混合(半角英語のみ)だと登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角数字含めて作成してください')
      end
      it 'passwordが半角英数混合(半角数字のみ)だと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角数字含めて作成してください')
      end
      it 'full_nameが空だと登録できない' do
        @user.full_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フルネームを入力してください")
      end
      it 'full_name_kanaが空だと登録できない' do
        @user.full_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナを入力してください")
      end
      it 'full_name_kanaが全角カナ以外だと登録できない' do
        @user.full_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナはカタカナで入力してください')
      end
      it 'gender_idが1(デフォルト)だと登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選んでください')
      end
      it 'phone_numberが空だと登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end
    end
  end

end
