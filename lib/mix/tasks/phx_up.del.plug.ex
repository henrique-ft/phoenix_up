defmodule Mix.Tasks.PhxUp.Del.Plug do
  @shortdoc "Delete a plug file and its test file"
  @moduledoc """
  Delete a plug file and a plug test file.

      mix phx_up.del.plug Request.Login.Filter

  or

      mix phx_up.del.p Request.Login.Filter

  The first argument is the plug name.
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
      |_|         |_____|            .del.plug
      """)
    end

    IO.puts("... Deleting plug")

    context = get_context(args)

    delete_plug(context)
    delete_plug_test(context)

    IO.puts("")
  end

  defp delete_plug(context) do
    path = "lib/#{context[:web_path]}/plugs/#{context[:path]}.ex"
    IO.puts(IO.ANSI.light_magenta() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp delete_plug_test(context) do
    path = "test/#{context[:web_path]}/plugs/#{context[:path]}_test.exs"
    IO.puts(IO.ANSI.light_magenta() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

