defmodule ToyRobot.CommandInterpreter do
  @doc """
  Interpreta comandos de uma lista de comandos, preparando-os para serem executados

  ## Exemplo

  ### Comandos válidos

    iex> alias ToyRobot.CommandInterpreter
    ToyRobot.CommandInterpreter
    iex> commands = ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    ["PLACE 1,2,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    iex> commands |> CommandInterpreter.interpret()
    [
      {:place, %{x: 1, y: 2, facing: :north}},
      :move,
      :turn_left,
      :turn_right,
      :report
    ]

  ### Comandos inválidos
    iex> alias ToyRobot.CommandInterpreter
    ToyRobot.CommandInterpreter
    iex> commands = ["SPIN", "TWIRL", "EXTERMINATE"]
    ["SPIN", "TWIRL", "EXTERMINATE"]
    iex> commands |> CommandInterpreter.interpret()
    [
      {:invalid, "SPIN"},
      {:invalid, "TWIRL"},
      {:invalid, "EXTERMINATE"}
    ]
  """

  # Função principal para interpretar os comandos
  def interpret(commands) do
    commands
    |> Enum.map(&do_interpret/1)
  end

  # Comando PLACE
  defp do_interpret("PLACE " <> rest) do
    [x, y, facing] = String.split(rest, ",")
    %{x: String.to_integer(x), y: String.to_integer(y), facing: parse_facing(facing)}
    |> then(&{:place, &1})
  end

  # Comando MOVE
  defp do_interpret("MOVE") do
    :move
  end

  # Comando LEFT
  defp do_interpret("LEFT") do
    :turn_left
  end

  # Comando RIGHT
  defp do_interpret("RIGHT") do
    :turn_right
  end

  # Comando REPORT
  defp do_interpret("REPORT") do
    :report
  end

  # Comandos inválidos
  defp do_interpret(command) do
    {:invalid, command}
  end

  # Mapeamento das direções
  defp parse_facing("NORTH"), do: :north
  defp parse_facing("SOUTH"), do: :south
  defp parse_facing("EAST"), do: :east
  defp parse_facing("WEST"), do: :west
end
