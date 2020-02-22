![PhoenixUp](https://github.com/henriquefernandez/phoenix_up/blob/master/priv/static/logo-small.png)

# PhoenixUp

![version badge](https://img.shields.io/hexpm/v/phoenix_up?style=flat-square) ![license badge](https://img.shields.io/github/license/henriquefernandez/phoenix_up?style=flat-square)

PhoenixUp provide this extra generators for *Phoenix* projects development:

`phx_up.gen.controller Some.ControllerName` (`phx_up.gen.c`)

`phx_up.gen.view Some.ViewName` (`phx_up.gen.v`)

`phx_up.gen.controller_view Some.ControllerViewName` (`phx_up.gen.cv`)

`phx_up.gen.module Some.ModuleName` (`phx_up.gen.m`)

`phx_up.gen.web_module Some.WebModuleName` (`phx_up.gen.wm`)

`phx_up.gen.plug Some.PlugName` (`phx_up.gen.p`)

All the files generated come with the corresponding test file.

I hope you **enjoy**!


## Installation

The package can be installed by adding `phoenix_up` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_up, "~> 0.1.1", only: :dev}
  ]
end
```

## Contribute

*PhoenixUp* is not only for me, but for the *Elixir* community.

I'm totally open to new ideas. Fork, open issues and feel free to contribute with no bureaucracy. We only need to keep some patterns to maintain an organization:

#### branchs

*your_branch_name*

#### commits

*[your_branch_name] Your commit*

