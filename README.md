# 🤖 Robô Navegador em Elixir

Projeto em Elixir onde um robô se movimenta em um tabuleiro virtual com base em comandos contidos em um **arquivo de texto**.

---

## 🛠️ Requisitos

- [Elixir](https://elixir-lang.org/install.html) instalado (versão 1.12 ou superior recomendada)

---

## 📁 Formato do arquivo de entrada

Crie um arquivo `commands.txt` com o seguinte formato:
```bash
  x y DIREÇÃO
  COMANDOS
  0 0 NORTH
  RAALAL
```
- **Primeira linha**: posição inicial e direção (`NORTH`, `SOUTH`, `EAST`, `WEST`)
- **Segunda linha**: sequência de comandos:
  - `A` = avançar
  - `L` = virar à esquerda
  - `R` = virar à direita

---

## 🚀 Como executar

Para executar o programa utilizando o arquivo **commands.txt**, digite o seguinte comando no terminal:

```shell
$ mix run robot.exs
```
O programa lerá o arquivo, executará os comandos e imprimirá o estado final do robô.

🧠 Exemplo de uso
Suponha que o conteúdo do commands.txt seja:

```
PLACE 1,2,NORTH
MOVE
LEFT
MOVE
RIGHT
MOVE
REPORT
```
Saída esperada:
```
O robô está na posição (0, 4) apontando para o norte
```





