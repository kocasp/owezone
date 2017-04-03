class EventAccessForm
  include ActiveModel::Model

  attr_accessor :user, :event, :user_email, :event_id, :access_type, :event_access

  validates :event_id, :access_type, :event, presence: true
  validates :user, presence: {message: "Has not been found!"}
  validate :event_access_uniqness
  validates :access_type, inclusion: { in: %w(guest editor),
    message: "%{value} is not a valid type" }

  def initialize(attributes = {})
    @user = User.find_by_email(attributes[:user_email])
    @event = Event.where(id: attributes[:event_id]).first
    @event_access = EventAccess.new(user: @user, event: @event, access_type: @access_type)
    super(attributes)
  end

  private

  def event_access_uniqness
    errors.add(:user, "already has access") if EventAccess.where(user: user, event: event).any?
  end

end

