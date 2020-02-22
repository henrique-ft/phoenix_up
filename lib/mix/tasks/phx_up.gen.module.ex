defmodule Mix.Tasks.PhxUp.Gen.Module do
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
      |_|         |_____|            .gen.module
      """)
    end

    IO.puts("... Preparing module")

    context = get_context(args)

    create_module(context)
    create_module_test(context)

    IO.puts("")
  end

  defp create_module(context) do
    copy_template(
      "module.eex",
      "lib/#{context[:base_path]}/#{context[:path]}.ex",
      context: context
    )
  end

  defp create_module_test(context) do
    copy_template(
      "module_test.eex",
      "test/lib/#{context[:base_path]}/#{context[:path]}_test.exs",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.module/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module]), do: Inflector.call(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
