defmodule Monarch.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # Because error messages were defined within Ecto, we must
    # call the Gettext module passing our Gettext backend. We
    # also use the "errors" domain as translations are placed
    # in the errors.po file. On your own code and templates,
    # this could be written simply as:
    #
    #     dngettext "errors", "1 file", "%{count} files", count
    #
    count = opts[:count]

    if count do
      Gettext.dngettext(Monarch.Gettext, "errors", msg, msg, opts[:count], opts)
    else
      Gettext.dgettext(Monarch.Gettext, "errors", msg, opts)
    end
  end

  def translate_error(msg) do
    Gettext.dgettext(Monarch.Gettext, "errors", msg)
  end
end
