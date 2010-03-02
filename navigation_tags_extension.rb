# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationTagsExtension < Radiant::Extension
  version "2.0"
  description "Makes building navigations much easier."
  url "http://yourwebsite.com/navigation_tags"
  
  # define_routes do |map|
  #   map.connect 'admin/navigation_tags/:action', :controller => 'admin/navigation_tags'
  # end
  
  def activate
    Page.send :include, NavigationTags
    admin.tabs.add "Navigation Type", "/admin/navigation_types", :after => "Layouts", :visibility => [:all]
    admin.page.edit.add :parts_bottom, "navigationType", :after  => 'edit_layout_and_type'
  end
  
  def deactivate
    # admin.tabs.remove "Navigation Tags"
  end
  
end