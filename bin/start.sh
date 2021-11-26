#!/bin/sh

bin/demo_elixir_app eval "DemoElixirApp.ReleaseTasks.migrate()"

bin/demo_elixir_app start
