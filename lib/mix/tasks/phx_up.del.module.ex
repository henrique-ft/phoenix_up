defmodule Mix.Tasks.PhxUp.Del.Module do
  @shortdoc "Delete a module file in lib/your_app and a module test file"
  @moduledoc """
  Delete a module file in lib/your_app and its test file.

      mix phx_up.del.module Post.Validator

  or

      mix phx_up.del.m Post.Validator

  The first argument is the module name.
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
      |_|         |_____|            .del.module
      """)
    end

    IO.puts("... Deleting module")

    context = get_context(args)

    delete_module(context)
    delete_module_test(context)

    IO.puts("")
  end

  defp delete_module(context) do
    path = "lib/#{context[:base_path]}/#{context[:path]}.ex"
    IO.puts(IO.ANSI.light_red() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp delete_module_test(context) do
    path = "test/lib/#{context[:base_path]}/#{context[:path]}_test.exs"
    IO.puts(IO.ANSI.light_red() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

