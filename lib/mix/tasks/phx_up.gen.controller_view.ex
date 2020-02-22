defmodule Mix.Tasks.PhxUp.Gen.ControllerView do
  @shortdoc "Generate a controller, a view and tests"
  @moduledoc """
  Generate a controller, a view and tests files for each one.

      mix phx_up.gen.controller_view Post create update index find

  or

      mix phx_up.gen.cv Post create update index find

  The first argument is the controller module followed by the actions.

  Actions can be empty.
  """

  use Mix.Task

  @doc false
  def run(io_puts \\ true, args) do
    if io_puts == true do
      IO.puts("""
           _             __ __ _____
       ___| |_ _ _      |  |  |  _  |
      | . |   |_'_|     |  |  |   __|
      |  _|_|_|_,_|_____|_____|__|
      |_|         |_____|            .gen.controller_view
      """)
    end

    Mix.Tasks.PhxUp.Gen.Controller.run(false, args)
    Mix.Tasks.PhxUp.Gen.View.run(false, args)
  end
end

