class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男' },
    { id: 3, name: '女' },
    ]
end
