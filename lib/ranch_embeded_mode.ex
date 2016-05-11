defmodule RanchEmbededMode do
  use Application
  def start(_type, _args) do
    RanchEmbededMode.SupervisorEmbed.start_link
  end
end
