defmodule Mix.Tasks.PhxUp.Del.M do
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
      |_|         |_____|            .del.module
      """)
    end

    Mix.Tasks.PhxUp.Del.Module.run(false, args)
  end
end
