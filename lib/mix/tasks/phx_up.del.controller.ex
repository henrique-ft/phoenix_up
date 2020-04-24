defmodule Mix.Tasks.PhxUp.Del.Controller do
  @shortdoc "Deletes a controller file and its controller test file"
  @moduledoc """
  Deletes a controller file and its controller test file.

      mix phx_up.del.controller Post

  or

      mix phx_up.del.c Post

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
      |_|         |_____|            .del.controller
      """)
    end

    IO.puts("... Deleting controller")
    context = get_context(args)

    delete_controller(context)
    delete_controller_test(context)

    IO.puts("")
  end

  defp delete_controller(context) do
    path = "lib/#{context[:web_path]}/controllers/#{context[:path]}_controller.ex"
    IO.puts(IO.ANSI.yellow() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp delete_controller_test(context) do
    path = "test/#{context[:web_path]}/controllers/#{context[:path]}_controller_test.exs"
    IO.puts(IO.ANSI.yellow() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

