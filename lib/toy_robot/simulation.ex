defmodule ToyRobot.Simulation do
  alias ToyRobot.{Robot, Table}

  defstruct [:table, :robot]

  @doc """
  Simula o posicionamento do robô no tabuleiro.
  """
  def place(table, %{x: x, y: y, facing: facing}) do
    if x >= 0 and y >= 0 and x <= table.x_max and y <= table.y_max do
      robot = %Robot{x: x, y: y, facing: facing}
      {:ok, %ToyRobot.Simulation{table: table, robot: robot}}
    else
      {:error, :invalid_placement}
    end
  end

  @doc """
  Movimenta o robô um espaço da direção que ele está apontando,
  a menos que essa posição esteja além dos limites do tabuleiro.
  """
  def move(%ToyRobot.Simulation{robot: robot, table: table} = simulation) do
    new_robot = Robot.move(robot)

    if valid_position?(new_robot, table) do
      {:ok, %ToyRobot.Simulation{simulation | robot: new_robot}}
    else
      {:error, :at_table_boundary}
    end
  end

  defp valid_position?(%Robot{x: x, y: y}, %Table{x_max: x_max, y_max: y_max}) do
    x in 0..x_max and y in 0..y_max
  end

  @doc """
  Gira o robô no sentido anti-horário (esquerda)
  """
  def turn_left(%ToyRobot.Simulation{robot: robot} = simulation) do
    {:ok, %ToyRobot.Simulation{simulation | robot: Robot.turn_left(robot)}}
  end

  @doc """
  Gira o robô no sentido horário (direita)
  """
  def turn_right(%ToyRobot.Simulation{robot: robot} = simulation) do
    {:ok, %ToyRobot.Simulation{simulation | robot: Robot.turn_right(robot)}}
  end

  @doc """
  Exibir a posição atual do robô
  """
  def report(%ToyRobot.Simulation{robot: robot}) do
    robot
  end

  @doc """
  Função auxiliar para permitir chamadas com apenas o placement.
  Cria uma Table padrão (5x5) e chama place/2.
  """
  def place_robot(%{x: _, y: _, facing: _} = placement) do
    table = %Table{x_max: 4, y_max: 4}
    place(table, placement)
  end
end
