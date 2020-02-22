defmodule Mix.Tasks.PhxUp.Gen.Plug do
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
      |_|         |_____|            .gen.plug
      """)
    end

    IO.puts("... Preparing plug")

    context = get_context(args)

    create_plug(context)
    create_plug_test(context)

    IO.puts("")
  end

  defp create_plug(context) do
    copy_template(
      "plug.eex",
      "lib/#{context[:web_path]}/plugs/#{context[:path]}.ex",
      context: context
    )
  end

  defp create_plug_test(context) do
    copy_template(
      "plug_test.eex",
      "test/#{context[:web_path]}/plugs/#{context[:path]}_test.exs",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.plug/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module|_]), do: Inflector.call(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
