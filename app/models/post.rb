class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true
  validates :body, :length => {
    :minimum   => 50,
    :tokenizer => lambda { |str| str.scan(/\s+|$/) },
    :too_short => "must have at least %{count} words",
    :too_long  => "must have at most %{count} words"
  }
end
