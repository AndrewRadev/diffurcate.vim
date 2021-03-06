require 'vimrunner'
require 'vimrunner/rspec'
require_relative './support/vim'

Vimrunner::RSpec.configure do |config|
  config.reuse_server = true

  plugin_path = File.expand_path('.')

  config.start_vim do
    vim = Vimrunner.start_gvim
    vim.add_plugin(plugin_path, 'plugin/diffurcate.vim')

    def vim.buffer_contents
      echo(%<join(getbufline('%', 1, '$'), "\n")>)
    end

    vim
  end
end

RSpec.configure do |config|
  config.include Support::Vim
end
