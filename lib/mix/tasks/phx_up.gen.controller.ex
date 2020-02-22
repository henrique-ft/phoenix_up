defmodule Mix.Tasks.PhxUp.Gen.Controller do
  @shortdoc false
  @moduledoc false

  alias PhoenixUp.Mix.Inflector
  use Mix.Task

  @doc false
  def run(io_puts \\ true, args) do
    if io_puts == true do
      IO.puts("""
           _             __ __ _____
       ___| |_ _ _      |  |  |  _  |
      | . |   |_'_|     |  |  |   __|
      |  _|_|_|_,_|_____|_____|__|
      |_|         |_____|            .gen.controller
      """)
    end

    IO.puts("... Preparing user controller")

    context = get_context(args)

    create_controller(context)
    create_controller_test(context)

    IO.puts("")
  end

  defp create_controller(context) do
    copy_template(
      "controller.eex",
      "lib/#{context[:web_path]}/controllers/#{context[:path]}_controller.ex",
      context: context
    )
  end

  defp create_controller_test(context) do
    copy_template(
      "controller_test.eex",
      "test/#{context[:web_path]}/controllers/#{context[:path]}_controller_test.exs",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.controller/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module]), do: Inflector.call(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
