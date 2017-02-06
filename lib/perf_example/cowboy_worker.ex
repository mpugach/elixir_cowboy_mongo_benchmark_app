defmodule PerfExample.CowboyWorker do
  def run do
    routes = [
      {"/static", Handler.Static, []},
      {"/mongo", Handler.Mongo, []},
    ]

    dispatch = :cowboy_router.compile([{:_, routes}])

    {:ok, _pid} = :cowboy.start_clear(:http, 100, [port: 8000], %{env: %{dispatch: dispatch}})
  end
end
