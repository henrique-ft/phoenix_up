defmodule Mix.Tasks.PhxUp.Del.View do
  @shortdoc "Delete a view file and its test"
  @moduledoc """
  Delete a view file and its test.

      mix phx_up.del.view Posts

  or

      mix phx_up.del.v Posts

  The first argument is the view module name.
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
      |_|         |_____|            .del.view
      """)
    end

    IO.puts("... Deleting view")

    context = get_context(args)

    delete_view(context)
    delete_view_test(context)

    IO.puts("")
  end

  defp delete_view(context) do
    path = "lib/#{context[:web_path]}/views/#{context[:path]}_view.ex"
    IO.puts(IO.ANSI.light_red() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp delete_view_test(context) do
    path = "test/#{context[:web_path]}/views/#{context[:path]}_view_test.exs"
    IO.puts(IO.ANSI.light_red() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

