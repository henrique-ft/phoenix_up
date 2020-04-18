defmodule Mix.Tasks.PhxUp.Gen.ControllerViewTemplate do
  @shortdoc "Generate a controller, view and template (for each action) and tests"
  @moduledoc """
  Generate a controller, view, templates (for each action) and tests.

      mix phx_up.gen.controller_view_template Post create update index find

  or

      mix phx_up.gen.cvt Post create update index find

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
      |_|         |_____|            .gen.controller_view_template
      """)
    end

    IO.puts("... Preparing controller")

    context = get_context(args)
    actions = get_actions(args)

    create_controller(context, actions)
    create_controller_test(context, actions)

    IO.puts("")
    Mix.Tasks.PhxUp.Gen.View.run(false, args)

    for action <- actions do
      Mix.Tasks.PhxUp.Gen.Template.run(false, ["#{context[:path]}/#{action}"])
    end

    IO.puts("")
  end

  defp create_controller(context, actions) do
    copy_template(
      "controller.eex",
      "lib/#{context[:web_path]}/controllers/#{context[:path]}_controller.ex",
      context: context,
      actions: actions
    )
  end

  defp create_controller_test(context, actions) do
    copy_template(
      "controller_test.eex",
      "test/#{context[:web_path]}/controllers/#{context[:path]}_controller_test.exs",
      context: context,
      actions: actions
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.controller_view_template/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_actions([_|actions]), do: actions
  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

