require 'spec_helper'

describe "Git diffs" do
  specify "works with a git diff" do
    write_file 'example.diff', <<~EOF
      diff --git Cargo.lock Cargo.lock
      index 8f3e476..fe4adc2 100644
      --- Cargo.lock
      +++ Cargo.lock
      @@ -886,14 +886,13 @@ dependencies = [

       [[package]]
       name = "quickmd"
      -version = "0.4.2"
      +version = "0.4.0"
       dependencies = [
         "anyhow",
         "claim",
      @@ -1169,18 +1168,18 @@ dependencies = [

       [[package]]
       name = "thiserror"
      -version = "1.0.26"
      +version = "1.0.23"
       source = "registry+https://github.com/rust-lang/crates.io-index"
       checksum = "93119e4feac1cbe6c798c34d3a53ea0026b0b1de6a120deef895137c0529bfe2"
       dependencies = [
      diff --git Cargo.toml Cargo.toml
      index 37f7e91..61c3a86 100644
      --- Cargo.toml
      +++ Cargo.toml
      @@ -1,6 +1,6 @@
       [package]
       name        = "quickmd"
      -version     = "0.4.2"
      +version     = "0.4.0"
       authors     = ["Andrew Radev <andrew.radev@protonmail.com>"]
       edition     = "2018"
       license     = "MIT OR Apache-2.0"
    EOF

    vim.edit 'example.diff'
    vim.command 'Diffurcate'

    expect(vim.command('pwd')).to start_with '/tmp'

    vim.edit 'Cargo.lock.diff'
    expect(vim.buffer_contents).to eq(<<~EOF.strip)
      index 8f3e476..fe4adc2 100644
      --- Cargo.lock
      +++ Cargo.lock
      @@ -886,14 +886,13 @@ dependencies = [

       [[package]]
       name = "quickmd"
      -version = "0.4.2"
      +version = "0.4.0"
       dependencies = [
         "anyhow",
         "claim",
      @@ -1169,18 +1168,18 @@ dependencies = [

       [[package]]
       name = "thiserror"
      -version = "1.0.26"
      +version = "1.0.23"
       source = "registry+https://github.com/rust-lang/crates.io-index"
       checksum = "93119e4feac1cbe6c798c34d3a53ea0026b0b1de6a120deef895137c0529bfe2"
       dependencies = [
    EOF

    vim.edit 'Cargo.toml.diff'
    expect(vim.buffer_contents).to eq(<<~EOF.strip)
      index 37f7e91..61c3a86 100644
      --- Cargo.toml
      +++ Cargo.toml
      @@ -1,6 +1,6 @@
       [package]
       name        = "quickmd"
      -version     = "0.4.2"
      +version     = "0.4.0"
       authors     = ["Andrew Radev <andrew.radev@protonmail.com>"]
       edition     = "2018"
       license     = "MIT OR Apache-2.0"
    EOF
  end

  specify "works with git diff with a/, b/ prefixes" do
    write_file 'example.diff', <<~EOF
      diff --git a/test.txt b/test.txt
      index e69de29..8020fdb 100644
      --- a/test.txt
      +++ b/test.txt
      @@ -0,0 +1 @@
      +testing diff
    EOF

    vim.edit 'example.diff'
    vim.command 'Diffurcate'

    expect(vim.command('pwd')).to start_with '/tmp'

    vim.edit 'test.txt.diff'
    expect(vim.buffer_contents).to eq(<<~EOF.strip)
      index e69de29..8020fdb 100644
      --- a/test.txt
      +++ b/test.txt
      @@ -0,0 +1 @@
      +testing diff
    EOF
  end
end
