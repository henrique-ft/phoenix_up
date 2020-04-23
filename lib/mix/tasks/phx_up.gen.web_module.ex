defmodule Mix.Tasks.PhxUp.Gen.WebModule do
  @shortdoc "Generate a module in lib/your_app_web and its test"
  @moduledoc """
  Generate a module in lib/your_app_web and its test.

      mix phx_up.gen.web_module Some.Web.Module

  or

      mix phx_up.gen.wm Some.Web.Module

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
      |_|         |_____|            .gen.web_module
      """)
    end

    IO.puts("... Preparing web module")

    context = get_context(args)

    create_web_module(context)
    create_web_module_test(context)

    IO.puts("")
  end

  defp create_web_module(context) do
    copy_template(
      "web_module.eex",
      "lib/#{context[:web_path]}/#{context[:path]}.ex",
      context: context
    )
  end

  defp create_web_module_test(context) do
    copy_template(
      "web_module_test.eex",
      "test/#{context[:web_path]}/#{context[:path]}_test.exs",
      context: context
    )
  end

  defp copy_template(name, final_path, opts) do
    Path.join(:code.priv_dir(:phoenix_up), "templates/phx_up.gen.web_module/#{name}")
    |> Mix.Generator.copy_template(final_path, opts)
  end

  defp get_context([module|_]), do: PhoenixUp.inflect(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
