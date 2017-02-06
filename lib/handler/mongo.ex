defmodule Handler.Mongo do
  def init(req, opts) do
    resp = :cowboy_req.reply(200, %{"content-type" => "application/json"}, body(), req)

    {:ok, resp, opts}
  end

  def body do
    {:ok, json} =
      cursor()
      |> Enum.map(&serialize_element/1)
      |> Poison.encode

    json
  end

  def serialize_element(element) do
    {:ok, id} = Map.fetch(element, "_id")
    {:ok, date} = Map.fetch(element, "date")

    %{element | "_id" => BSON.ObjectId.encode!(id), "date" => BSON.DateTime.to_iso8601(date)}
  end

  def cursor do
    Mongo.find(:mongo, Application.get_env(:perf_example, :collection), %{}, limit: 20, pool: DBConnection.Poolboy)
  end
end
