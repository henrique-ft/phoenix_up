defmodule Mix.Tasks.PhxUp.Gen.Template do
  @shortdoc "Generate a template file"
  @moduledoc false

  use Mix.Task

  @doc false
  def run(io_puts \\ true, args) do
    if io_puts == true do
      IO.puts("""
           _             __ __ _____
       ___| |_ _ _      |  |  |  _  |
      | . |   |_'_|     |  |  |   __|
      |  _|_|_|_,_|_____|_____|__|
      |_|         |_____|            .gen.template
      """)
    end

    IO.puts("... Preparing template")

    context = get_context(args)

    create_template(context)

    IO.puts("")
  end

  defp create_template(context) do
    copy_template(
      "template.eex",
      "lib/#{context[:web_path]}/templates/#{context[:path]}.html.eex",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.template/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end

