module ApplicationHelper
  def object_for_hbs(object, view, format = "hash")
    Rabl::Renderer.new(view, object, view_path: "app/views", format: format).render
  end
end
