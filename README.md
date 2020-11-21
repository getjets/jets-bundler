# Jets Bundler

Bundler extensions for Jets.

## `#component` method

[Source](./lib/bundler/component.rb)

This helper method is used to define a component (engine) as a dependency
when using a [shared Gemfile.lock]() for all engines.

It does the following three things:

- Define the comoponent as a dependency for `:default` and its own **named group** (`gem "component", path: "engines/component", group: [ :default, :component ]`).
- Loads the component's `Gemfile.runtime` if any to the same groups (`eval_gemfile "engines/component/Gemfile.runtime`).
- Adds all development dependencies from the `component.gemspec` **only to the component group** (`gem "dev-dep", group: [:component]`)

## `#eval_gemfile` patch

[Source](./lib/bundler/eval_gemfile.rb)

This patch helps to avoid Bundler warnings regarding duplicate gems. It
checks whether a Gemfile has already been included and skip it, if so.