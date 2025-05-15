defmodule ToyRobot.CommandRunner do
  alias ToyRobot.{Simulation, Robot}

  def run(commands), do: run(commands, nil)

  # Primeiro trata PLACE quando ainda não há simulação
  def run([{:place, placement} | rest], nil) do
    case Simulation.place_robot(placement) do
      {:ok, simulation} -> run(rest, simulation)
      {:error, _} -> run(rest, nil)
    end
  end

  # Depois ignora qualquer outro comando antes do PLACE
  def run([_ | rest], nil), do: run(rest, nil)

  # Novo PLACE com simulação ativa
  def run([{:place, placement} | rest], simulation) do
    case Simulation.place_robot(placement) do
      {:ok, new_sim} -> run(rest, new_sim)
      {:error, _} -> run(rest, simulation)
    end
  end

  def run([:move | rest], simulation) do
    case simulation do
      nil -> run(rest, nil)
      _ ->
        case Simulation.move(simulation) do
          {:ok, new_sim} -> run(rest, new_sim)
          {:error, _} -> run(rest, simulation)
        end
    end
  end

  # Alterando :left para :turn_left e :right para :turn_right
  def run([:turn_left | rest], simulation) do
    case simulation do
      nil -> run(rest, nil)
      _ ->
        case Simulation.turn_left(simulation) do
          {:ok, new_sim} -> run(rest, new_sim)
          {:error, _} -> run(rest, simulation)
        end
    end
  end

  def run([:turn_right | rest], simulation) do
    case simulation do
      nil -> run(rest, nil)
      _ ->
        case Simulation.turn_right(simulation) do
          {:ok, new_sim} -> run(rest, new_sim)
          {:error, _} -> run(rest, simulation)
        end
    end
  end

  def run([:report | rest], simulation) do
    case simulation do
      nil -> IO.puts("Sem simulação válida.")
      _ -> Robot.report(simulation.robot) |> IO.puts()
    end

    run(rest, simulation)
  end

  # Adicionando tratamento para comandos inválidos
  def run([{:invalid, _} | rest], simulation) do
    IO.puts("Comando inválido")
    run(rest, simulation)
  end

  def run([], simulation), do: simulation
end
