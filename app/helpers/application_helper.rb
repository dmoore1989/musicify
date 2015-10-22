module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end

  def delete_item(element)
    <<-HTML.html_safe
      <form action="/#{element.model_name.plural}/#{element.id}" method="post">
        <input type="hidden" name="_method" value="delete">

        <input
          type="hidden"
          name="authenticity_token"
          value="#{form_authenticity_token}">

        <input type="submit" value="Delete this #{element.model_name.human}">
      </form>
    HTML
  end
end
