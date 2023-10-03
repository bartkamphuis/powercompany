class PagesController < ApplicationController
  def home
    @customers = Customer.all
    @packs = Pack.all
  end

  def about
    # show content of local file README.md and render as markdown
    @markdown = File.read("README.md")
    render markdown: @markdown
  end
end
