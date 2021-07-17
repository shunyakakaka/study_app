FactoryBot.define do
  factory :record do
    time {60}
    task_kind {"プログラミング"}
    user
  end
end
