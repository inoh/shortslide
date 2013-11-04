class Control
  include ActiveModel::Model
  attr_accessor :slide_id, :command, :message

  def execute
    Pusher['slides_' + slide_id.to_s].trigger(command, to_json)
  end
end
