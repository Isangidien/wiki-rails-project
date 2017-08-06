class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  delegate :email, to: :user, allow_nil: false

  def self.wikis
    Wiki.where( id: pluck(:wiki_id) )
  end
end
