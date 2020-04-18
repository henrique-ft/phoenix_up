defmodule Mix.Tasks.PhxUp.Gen.View do
  @shortdoc "Generate a view file and its test"
  @moduledoc """
  Generate a view file and its test.

      mix phx_up.gen.view Posts

  or

      mix phx_up.gen.v Posts

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
      |_|         |_____|            .gen.view
      """)
    end

    IO.puts("... Preparing view")

    context = get_context(args)

    create_view(context)
    create_view_test(context)

    IO.puts("")
  end

  defp create_view(context) do
    copy_template(
      "view.eex",
      "lib/#{context[:web_path]}/views/#{context[:path]}_view.ex",
      context: context
    )
  end

  defp create_view_test(context) do
    copy_template(
      "view_test.eex",
      "test/#{context[:web_path]}/views/#{context[:path]}_view_test.exs",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.view/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

