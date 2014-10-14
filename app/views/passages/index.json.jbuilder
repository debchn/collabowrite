json.array!(@passages) do |passage|
  json.extract! passage, :id, :user_id, :prompt_id, :text, :parent_id, :lft, :rgt
  json.url passage_url(passage, format: :json)
end
