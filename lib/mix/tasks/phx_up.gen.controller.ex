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

    IO.inspect(context)

    #create_user_controller(base_context)
    #create_user_view(base_context)
    #create_user_controller_test(base_context)
    #create_user_view_test(base_context)

    IO.puts("")
  end

  #defp create_user_controller(base_context) do
    #context = Inflector.call("#{base_context}UserController")

    #copy_template(
      #"user_controller.eex",
      #"lib/#{context[:web_path]}/controllers/#{context[:path]}.ex",
      #context: context
    #)
  #end

  #defp create_user_controller_test(base_context) do
    #context = Inflector.call("#{base_context}UserControllerTest")

    #user_module =
      #config(:user_module)
      #|> Atom.to_string()
      #|> String.replace("Elixir.", "")

    #repo =
      #config(:repo)
      #|> Atom.to_string()
      #|> String.replace("Elixir.", "")

    #copy_template(
      #"user_controller_test.eex",
      #"test/#{context[:web_path]}/controllers/#{context[:path]}_test.exs",
      #context: Keyword.merge(context, user_module: user_module, repo: repo)
    #)
  #end

  #defp create_user_view(base_context) do
    #context = Inflector.call("#{base_context}UserView")

    #copy_template("user_view.eex", "lib/#{context[:web_path]}/views/#{context[:path]}.ex",
      #context: context
    #)
  #end

  #defp create_user_view_test(base_context) do
    #context = Inflector.call("#{base_context}UserView")

    #copy_template(
      #"user_view_test.eex",
      #"test/#{context[:web_path]}/views/#{context[:path]}_test.exs",
      #context: context
    #)
  #end

  #defp copy_template(name, final_path, opts) do
    #Path.join(:code.priv_dir(:entrance), "templates/entrance.gen.phx_user_controller/#{name}")
    #|> Mix.Generator.copy_template(final_path, opts)
  #end

  defp get_context([module]), do: Inflector.call(module)
  defp get_context([]), do: raise(RuntimeError, "Invalid module name")
end
