defmodule Label do
  defstruct [:code, :label, :legacy]
end

defmodule LogLevel do
  def to_label(level, legacy?) do
    labels = [
      %Label{code: 0, label: :trace,   legacy: :no_legacy},
      %Label{code: 1, label: :debug,   legacy: :legacy},
      %Label{code: 2, label: :info,    legacy: :legacy},
      %Label{code: 3, label: :warning, legacy: :legacy},
      %Label{code: 4, label: :error,   legacy: :legacy},
      %Label{code: 5, label: :fatal,   legacy: :no_legacy},
    ]

    label = labels
    |> Enum.find(fn label -> label.code === level end)

    cond do
      label === nil -> :unknown
      not legacy? -> label.label
      legacy? and label.legacy === :legacy -> label.label
      legacy? and label.legacy === :no_legacy -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    log = to_label(level, legacy?)
    cond do
      log === :error or log === :fatal -> :ops
      legacy? and log === :unknown -> :dev1
      log === :unknown -> :dev2
      true -> false
    end
  end
end

