defmodule Mix.Tasks.PhxUp.Del.Template do
  @shortdoc "Deletes a template file"
  @moduledoc """
  Deletes a template file.

      mix phx_up.del.template my/template/path

  or

      mix phx_up.del.t my/template/path

  The first argument is the template path.
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
      |_|         |_____|            .del.template
      """)
    end

    IO.puts("... Deleting template")

    context = get_context(args)

    create_template(context)

    IO.puts("")
  end

  defp create_template(context) do
    path = "lib/#{context[:web_path]}/templates/#{context[:path]}.html.eex"
    IO.puts(IO.ANSI.light_magenta() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rm!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

