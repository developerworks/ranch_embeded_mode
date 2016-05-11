require Logger

defmodule RanchEmbededMode.SslAcceptor do
  @config Application.get_env(:ranch_embeded_mode, :ranch_ssl)
  def start_link do
    Logger.info "start ssl acceptors"

    {:ok, _} = :ranch.start_listener(
      @config[:listener_name],
      @config[:acceptors],
      @config[:transport],
      @config[:transport_options],
      RanchEmbededMode.SslProtocolHandler,
      []
    )
  end
end
