class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators

  has_many :users, through: :collaborators

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true

  def public?
    !private?
  end

  def collaborator_for(user)
    collaborators.find_by(user_id: user.id)
  end

end
