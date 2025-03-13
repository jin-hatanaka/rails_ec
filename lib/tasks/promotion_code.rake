namespace :promotion_code do
  desc "プロモーションコードを生成するタスク"
  task generate: :environment do
    list = []
    10.times do 
    list << {
      code: [*'a'..'z', *'A'..'Z', *0..9].sample(7).join,
      discount: [*100..1000].sample
    }
    end
    PromotionCode.create!(list)
    puts list
    puts "プロモーションコードの生成完了！"
  end
end
