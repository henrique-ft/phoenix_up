defmodule Mix.Tasks.PhxUp.Del.ControllerViewTemplate do
  @shortdoc "Deletes a controller, view, templates and tests"
  @moduledoc """
  Deletes a controller, view, templates (for each action) and tests.

      mix phx_up.del.controller_view_template Post

  or

      mix phx_up.del.cvt Post

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
      |_|         |_____|            .del.controller_view_template
      """)
    end

    IO.puts("... Deleting controller, view and templates")

    context = get_context(args)

    IO.puts("")
    Mix.Tasks.PhxUp.Del.Controller.run(false, args)

    delete_controller_templates_folder(context)

    IO.puts("")
    Mix.Tasks.PhxUp.Del.View.run(false, args)

    IO.puts("")
  end

  defp delete_controller_templates_folder(context) do
    path = "lib/#{context[:web_path]}/templates/#{context[:path]}"
    IO.puts(IO.ANSI.light_magenta() <> "* deleting " <> IO.ANSI.reset() <> path)
    File.rmdir!(path)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

