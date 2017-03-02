defmodule Tentacat.Repositories.Contents do
  import Tentacat
  alias Tentacat.Client

  @doc """
  Get the README

  ## Example

      Tentacat.Repositories.Contents.readme "elixir-lang", "elixir"
      Tentacat.Repositories.Contents.readme "elixir-lang", "elixir", client
      Tentacat.Repositories.Contents.readme "elixir-lang", "elixir", client, ref: "develop"

  More info at: https://developer.github.com/v3/repos/contents/#get-the-readme
  """
  @spec readme(binary, binary, Client.t, Keyword.t) :: Tentacat.response
  def readme(owner, repo, client \\ %Client{}, options \\ []) do
    get "repos/#{owner}/#{repo}/readme", client, options
  end

  @doc """
  Get contents

  ## Example

      Tentacat.Repositories.Contents.content "elixir-lang", "elixir", "README.md"
      Tentacat.Repositories.Contents.content "elixir-lang", "elixir", "README.md", client
      Tentacat.Repositories.Contents.content "elixir-lang", "elixir", "README.md", client, ref: "develop"

  More info at: https://developer.github.com/v3/repos/contents/#get-contents
  """
  @spec content(binary, binary, binary, Client.t, Keyword.t) :: Tentacat.response
  def content(owner, repo, path, client \\ %Client{}, options \\ []) do
    get "repos/#{owner}/#{repo}/contents/#{path}", client, options
  end

  @doc """
  Create a file

  ## Example

      Tentacat.Repositories.Contents.create_file "elixir-lang", "elixir", "lib/mix.exs", "content_base64_encoded", "commit_msg"
      Tentacat.Repositories.Contents.create_file "elixir-lang", "elixir", "lib/mix.exs", "content_base64_encoded", "commit_msg", client
      Tentacat.Repositories.Contents.create_file "elixir-lang", "elixir", "lib/mix.exs", "content_base64_encoded", "commit_msg", client, branch: "feature-xyz"

  More info at: https://developer.github.com/v3/repos/contents/#create-a-file
  """
  @spec create_file(binary, binary, binary, binary, binary, Client.t, Keyword.t) :: Tentacat.response
  def create_file(owner, repo, path, content, message, _client \\ %Client{}, options \\ []) do
    _options = Keyword.merge(options, content: content, message: message)
    # put "repos/#{owner}/#{repo}/contents/#{path}", client, options
  end

  @doc """
  Get archive link

  ## Example

      Tentacat.Repositories.archive_link "elixir-lang", "elixir", "tarball", "master"
      Tentacat.Repositories.archive_link "elixir-lang", "elixir", "tarball", "master", client

  More info at: https://developer.github.com/v3/repos/contents/#get-archive-link
  """
  @spec archive_link(binary, binary, binary, binary, Client.t) :: Tentacat.response
  def archive_link(owner, repo, format, ref, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/#{format}/#{ref}", client
  end
end
