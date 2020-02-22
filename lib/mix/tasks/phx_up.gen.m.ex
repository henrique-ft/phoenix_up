defmodule Mix.Tasks.PhxUp.Gen.M do
  @shortdoc false
  @moduledoc false

  use Mix.Task

  @doc false
  def run(io_puts \\ true, args) do
    if io_puts == true do
      IO.puts("""
           _             __ __ _____
       ___| |_ _ _      |  |  |  _  |
      | . |   |_'_|     |  |  |   __|
      |  _|_|_|_,_|_____|_____|__|
      |_|         |_____|            .gen.module
      """)
    end

    Mix.Tasks.PhxUp.Gen.Module.run(false, args)
  end
end
