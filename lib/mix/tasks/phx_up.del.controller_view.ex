defmodule Mix.Tasks.PhxUp.Del.ControllerView do
  @shortdoc "Deletes a controller, its views and tests"
  @moduledoc """
  Deletes a controller, its views and tests.

      mix phx_up.del.controller_view Post

  or

      mix phx_up.del.cv Post

  The first argument is the controller module.
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
      |_|         |_____|            .del.controller_view
      """)
    end

    Mix.Tasks.PhxUp.Del.Controller.run(false, args)
    Mix.Tasks.PhxUp.Del.View.run(false, args)
  end
end

