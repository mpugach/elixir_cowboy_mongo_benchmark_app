defmodule Handler.Static do
  def init(req, opts) do
    resp = :cowboy_req.reply(200, %{"content-type" => "application/json"}, body(), req)

    {:ok, resp, opts}
  end

  def body do
    "{}"
  end
end
