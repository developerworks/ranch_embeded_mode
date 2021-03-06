require Logger
defmodule RanchEmbededMode.SupervisorEmbed do
  use Supervisor

  def start_link do
    Logger.debug "Start supervisor."
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    children = [
      ranch_sup(),
      ranch_embeded_mode_listener()
    ]
    Logger.debug "supervisor child spec #{inspect children}"
    opts = [strategy: :one_for_one, name: __MODULE__]
    Logger.debug "strategy #{inspect opts}"
    supervise(children, opts)
  end

  def ranch_sup do
    supervisor(:ranch_sup, [], [shutdown: 5000])
  end

  @doc """
  Ranch 提供了一个辅助函数能够更便捷的创建监听器的 Child Spec
  """
  def ranch_embeded_mode_listener do
    :ranch.child_spec(
      :ranch_embeded_mode_listener,
      10,
      :ranch_tcp,
      [port: 5555],
      RanchEmbededMode.TcpProtocolHandler, []
    )
  end
end
