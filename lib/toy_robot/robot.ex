defmodule ToyRobot.Robot do
  defstruct x: 0, y: 0, facing: :north

  alias ToyRobot.Robot

  @moduledoc """
  Documentação para o ToyRobot.Robot
  """

  @doc """
  Movimenta o robô uma posição para a direção que o mesmo está apontando.

  ## Exemplo
      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{y: 0, facing: :north}
      %Robot{y: 0, facing: :north}
      iex> robot |> Robot.move
      %Robot{y: 1}
  """
  def move(%Robot{facing: :north, y: y} = robot), do: %Robot{robot | y: y + 1}
  def move(%Robot{facing: :south, y: y} = robot), do: %Robot{robot | y: y - 1}
  def move(%Robot{facing: :east, x: x} = robot), do: %Robot{robot | x: x + 1}
  def move(%Robot{facing: :west, x: x} = robot), do: %Robot{robot | x: x - 1}

  defp move_right(robot), do: robot
  defp move_left(robot), do: robot
  defp move_north(robot), do: robot
  defp move_south(robot), do: robot

  @doc """
  Gira o robô no sentido anti-horário (esquerda)

  ## Exemplo
      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{x: 0, y: 0, facing: :north}
      %Robot{x: 0, y: 0, facing: :north}
      iex> robot |> Robot.turn_left
      %Robot{x: 0, y: 0, facing: :west}
  """
  def turn_left(%__MODULE__{facing: :north} = robot), do: %Robot{robot | facing: :west}
  def turn_left(%__MODULE__{facing: :west} = robot), do: %Robot{robot | facing: :south}
  def turn_left(%__MODULE__{facing: :south} = robot), do: %Robot{robot | facing: :east}
  def turn_left(%__MODULE__{facing: :east} = robot), do: %Robot{robot | facing: :north}

  @doc """
  Gira o robô no sentido horário (direita)

  ## Exemplo
      iex> alias ToyRobot.Robot
      ToyRobot.Robot
      iex> robot = %Robot{x: 0, y: 0, facing: :north}
      %Robot{x: 0, y: 0, facing: :north}
      iex> robot |> Robot.turn_right
      %Robot{x: 0, y: 0, facing: :east}
  """
  def turn_right(%__MODULE__{facing: :north} = robot), do: %Robot{robot | facing: :east}
  def turn_right(%__MODULE__{facing: :east} = robot), do: %Robot{robot | facing: :south}
  def turn_right(%__MODULE__{facing: :south} = robot), do: %Robot{robot | facing: :west}
  def turn_right(%__MODULE__{facing: :west} = robot), do: %Robot{robot | facing: :north}

  @doc """
  Gera uma string descritiva da posição e direção atual do robô.

  ## Exemplo
      iex> Robot.report(%Robot{x: 1, y: 2, facing: :north})
      "O robô está na posição (1, 2) apontando para o norte"
  """
  def report(%__MODULE__{x: x, y: y, facing: facing}) do
    direcao =
      case facing do
        :north -> "norte"
        :south -> "sul"
        :east -> "leste"
        :west -> "oeste"
      end

    "O robô está na posição (#{x}, #{y}) apontando para o #{direcao}"
  end
end
