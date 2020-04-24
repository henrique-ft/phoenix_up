defmodule Mix.Tasks.PhxUp.Del.WebModule do
  @shortdoc "Deletes a module in lib/your_app_web and its test"
  @moduledoc """
  Deletes a module in lib/your_app_web and its test.

      mix phx_up.del.web_module Some.Web.Module

  or

      mix phx_up.del.wm Some.Web.Module

  The first argument is the web module name.
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
      |_|         |_____|            .del.web_module
      """)
    end

    IO.puts("... Deleting web module")

    context = get_context(args)

    delete_web_module(context)
    delete_web_module_test(context)

    IO.puts("")
  end

  defp delete_web_module(context) do
    path = "lib/#{context[:web_path]}/#{context[:path]}.ex"
    IO.puts(IO.ANSI.yellow() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp delete_web_module_test(context) do
    path = "test/#{context[:web_path]}/#{context[:path]}_test.exs"
    IO.puts(IO.ANSI.yellow() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
