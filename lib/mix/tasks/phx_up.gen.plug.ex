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

    IO.puts("... Preparing require login plug")

    #context = Inflector.call("Plugs.#{get_context(args)}RequireLogin")

    #create_require_login_plug(context)
    #create_require_login_plug_test(context)

    IO.puts("")
  end

  #defp create_require_login_plug(context) do
    #copy_template("require_login.eex", "lib/#{context[:web_path]}/#{context[:path]}.ex",
      #context: context
    #)
  #end

  #defp create_require_login_plug_test(context) do
    #copy_template(
      #"require_login_test.eex",
      #"test/#{context[:web_path]}/#{context[:path]}_test.exs",
      #context: context
    #)
  #end

  #defp copy_template(name, final_path, opts) do
    #Path.join(:code.priv_dir(:entrance), "templates/entrance.gen.phx_require_login/#{name}")
    #|> Mix.Generator.copy_template(final_path, opts)
  #end

  #defp get_context(["--context", module]), do: "#{Inflector.call(module)[:scoped]}."
  #defp get_context([]), do: ""
end
