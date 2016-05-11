require Logger

defmodule RanchEmbededMode.TcpAcceptor do
  @config Application.get_env(:ranch_embeded_mode, :ranch_tcp)
  def start_link do
    Logger.info "start tcp acceptors"

    {:ok, _} = :ranch.start_listener(
      @config[:listener_name],
      @config[:acceptors],
      @config[:transport],
      @config[:transport_options],
      RanchEmbededMode.TcpProtocolHandler,
      []
    )
  end
end
