<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>
<%- search_model = "#{singular_table_name}_search" -%>
  def self.search(<%= search_model %>)
    @<%= plural_table_name %> = <%= class_name %>.all
<% attributes.each do |attribute| -%>
  <%- if attribute.type == :date -%>
    @<%= plural_table_name %> = @<%= plural_table_name %>
      .where(<%= attribute.name %>: <%= search_model %>.<%= attribute.name %>_from..<%= search_model %>.<%= attribute.name %>_to)
  <%- end -%>
<% end -%>
  end
end
<% end -%>
