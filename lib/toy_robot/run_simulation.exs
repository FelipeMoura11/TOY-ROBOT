alias ToyRobot.CommandInterpreter
alias ToyRobot.CommandRunner

commands = (
  "commands.txt"
  |> File.read!()
  |> String.split("\n", trim: true)
  |> CommandInterpreter.interpret()
)

ToyRobot.CommandRunner.run(commands)
