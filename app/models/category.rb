class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'サッカー、フットサル' },
    { id: 3, name: 'ボルタリング' },
    { id: 4, name: '野球' },
    { id: 5, name: 'ダーツ' },
    { id: 6, name: 'バレーボール' },
    { id: 7, name: 'バトミントン' },
    { id: 8, name: 'テニス' },
    { id: 9, name: '卓球' },
    { id: 10, name: 'その他' }
    ]
end
